# The version of Zarf to use. To keep this repo as portable as possible the Zarf binary will be downloaded and added to
# the build folder.
# renovate: datasource=github-tags depName=defenseunicorns/zarf
UDS_CLI_VERSION := v0.7.0
ZARF_VERSION := v0.31.4

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
build/all: build build/zarf build/uds build/software-factory-namespaces build/idam-dns build/idam-realm build/dubbd-rke2-nutanix build/idam-gitlab build/idam-sonarqube build/db-manifests build/object-store-manifests build/additional-kyverno-exceptions build/uds-bundle-software-factory ## Build everything


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

build/dubbd-rke2-nutanix: | build ## Build dubbd-rke2-nutanix package
	echo "nah"
	# cd packages/dubbd && ../../build/zarf package create . --confirm --output-directory ../../build

build/idam-gitlab: | build ## Build idam-gitlab package
	cd build && ./zarf package create ../packages/idam-gitlab/ --confirm --output-directory .

build/idam-sonarqube: | build ## Build idam-sonarqube package
	cd build && ./zarf package create ../packages/idam-sonarqube/ --skip-sbom --confirm --output-directory .

build/idam-dns: | build ## Build idam-dns package
	cd build && ./zarf package create ../packages/idam-dns/ --confirm --output-directory .

build/idam-realm: | build ## Build idam-realm package
	cd build && ./zarf package create ../packages/idam-realm/ --confirm --output-directory .

build/db-manifests: | build ## Build DB Manifests
	cd build && ./zarf package create ../packages/databases/confluence/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/gitlab/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/jira/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/keycloak/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/mattermost/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/nexus/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/databases/sonarqube/ --confirm --output-directory .

build/object-store-manifests: | build ## Build object store Manifests
	cd build && ./zarf package create ../packages/object-store/gitlab/ --confirm --output-directory .
	cd build && ./zarf package create ../packages/object-store/mattermost/ --confirm --output-directory .

build/additional-kyverno-exceptions: | build ## Build additional kyverno exceptions
	cd build && ./zarf package create ../packages/additional-kyverno-exceptions/ --confirm --output-directory .

build/uds-bundle-software-factory: | build ## Build the software factory
	cd build && ./uds create ../ --confirm
	mv uds-bundle-software-factory-*.tar.zst build/

########################################################################
# Deploy Section
########################################################################

deploy/test-cluster: ## Deploy the software factory package to the test cluster
	cp uds-config/test-cluster/uds-config.yaml ./build/
	cp deploy-dubbd-values.yaml ./build/
	cd ./build && ./uds deploy uds-bundle-software-factory-*.tar.zst --confirm

deploy/dev-cluster: ## Deploy the software factory package to the dev cluster
	cp uds-config/dev-cluster/uds-config.yaml ./build/
	cp deploy-dubbd-values.yaml ./build/
	cd ./build && ./uds deploy uds-bundle-software-factory-*.tar.zst --confirm

########################################################################
# Macro Section
########################################################################

all/test-cluster: build/all deploy/test-cluster ## Build and deploy the software factory to the test cluster

all/dev-cluster: build/all deploy/dev-cluster ## Build and deploy the software factory to the test cluster

.PHONY: rebuild
rebuild: clean build/all
