# The version of Zarf to use. To keep this repo as portable as possible the Zarf binary will be downloaded and added to
# the build folder.
# renovate: datasource=github-tags depName=defenseunicorns/zarf
UDS_CLI_VERSION := v0.0.5-alpha

ZARF_VERSION := v0.29.1

# Figure out which Zarf binary we should use based on the operating system we are on
ZARF_BIN := zarf
UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)
ifeq ($(UNAME_M),x86_64)
    ARCH := amd64
else ifeq ($(UNAME_M),amd64)
    ARCH := amd64
else ifeq ($(UNAME_M),arm64)
    ARCH := arm64
else
    $(error Unsupported architecture: $(UNAME_M))
endif

# Silent mode by default. Run `make VERBOSE=1` to turn off silent mode.
ifndef VERBOSE
.SILENT:
endif

# Optionally add the "-it" flag for docker run commands if the env var "CI" is not set (meaning we are on a local machine and not in github actions)
TTY_ARG :=
ifndef CI
	TTY_ARG := -it
endif

.DEFAULT_GOAL := help

# Target vars
CERT_PATH := scripts/test-cluster-ingress-cert.pem
KEY_PATH := scripts/test-cluster-ingress-key.pem

# Idiomatic way to force a target to always run, by having it depend on this dummy target
FORCE:

.PHONY: help
help: ## Show a list of all targets
	grep -E '^\S*:.*##.*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1:\3/p' \
	| column -t -s ":"

########################################################################
# Build Section
########################################################################

.PHONY: build/all
build/all: build build/zarf build/uds build/software-factory-namespaces build/idam-dns build/idam-realm build/idam-gitlab build/idam-sonarqube build/uds-bundle-software-factory ## Build everything

build: ## Create build directory
	mkdir -p build

.PHONY: clean
clean: ## Clean up build files
	rm -rf ./build

.PHONY: build/zarf
build/zarf: | build ## Download the Zarf to the build dir
	if [ -f build/zarf ] && [ "$$(build/zarf version)" = "$(ZARF_VERSION)" ] ; then exit 0; fi && \
	echo "Downloading zarf" && \
	curl -sL https://github.com/defenseunicorns/zarf/releases/download/$(ZARF_VERSION)/zarf_$(ZARF_VERSION)_$(UNAME_S)_$(ARCH) -o build/zarf && \
	chmod +x build/zarf

.PHONY: build/uds
build/uds: | build ## Download uds-cli to the build dir
	if [ -f build/uds ] && [ "$$(build/uds version)" = "$(UDS_CLI_VERSION)" ] ; then exit 0; fi && \
	echo "Downloading uds-cli" && \
	curl -sL https://github.com/defenseunicorns/uds-cli/releases/download/$(UDS_CLI_VERSION)/uds-cli_$(UDS_CLI_VERSION)_$(UNAME_S)_$(ARCH) -o build/uds && \
	chmod +x build/uds

build/software-factory-namespaces: | build ## Build namespaces package
	cd build && ./zarf package create ../packages/namespaces/ --confirm --output-directory .

build/idam-gitlab: | build ## Build idam-gitlab package
	cd build && ./zarf package create ../packages/idam-gitlab/ --confirm --output-directory .

build/idam-sonarqube: | build ## Build idam-sonarqube package
	cd build && ./zarf package create ../packages/idam-sonarqube/ --confirm --output-directory .

build/idam-dns: | build ## Build idam-dns package
	cd build && ./zarf package create ../packages/idam-dns/ --confirm --output-directory .

build/idam-realm: | build ## Build idam-realm package
	cd build && ./zarf package create ../packages/idam-realm/ --confirm --output-directory .

build/uds-bundle-software-factory: | build ## Build the software factory
	cd build && ./uds bundle create ../ --confirm
	mv uds-bundle-software-factory-*.tar.zst build/

########################################################################
# Deploy Section
########################################################################

deploy: ## Deploy the software factory package
	cp uds-config.yaml ./build/
	cp deploy-dubbd-values.yaml ./build/
	cd ./build && ./uds bundle deploy uds-bundle-software-factory-*.tar.zst --confirm
	cd ./scripts && ./update-certs.sh $(CERT_PATH) $(KEY_PATH)

########################################################################
# Macro Section
########################################################################

.PHONY: all
all: build/all deploy ## Build and deploy the software factory

.PHONY: rebuild
rebuild: clean build/all
