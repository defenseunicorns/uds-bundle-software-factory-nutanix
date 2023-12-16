# uds-bundle-software-factory-nutanix
Detailed list of packages and dependencies in this bundle:
[packages-and-dependencies.md](docs/packages-and-dependencies.md)

## Developer Info

[DEVELOPMENT_MAINTENANCE.md](docs/DEVELOPMENT_MAINTENANCE.md)

## Key Points
This project is continually improving and being iterated on. Stay tuned to the latest updates.
### Things you will need
- You need an appropriately provisioned kubernetes cluster to deploy to.
- You need all databases and object storage provisioned with connection configurations ready to plug into your `uds-config.yaml`. Click the links for more documentation on creation and configuration of your [databases](docs/database-creation-and-configuration.md) and [object store](docs/object-store-creation-and-configuration.md)
- You need domain configuration and certs ready for use
- You need [zarf](https://github.com/defenseunicorns/zarf) and [uds](https://github.com/defenseunicorns/uds-cli)
- You need a bundle artifact. You can build it from this repository, download it or reference it directly from the [oci registry](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/pkgs/container/uds-bundle%2Fsoftware-factory-nutanix)
- You need a `uds-config.yaml` that is set up for your environment.

## The Bundle

When disconnected, you can download the tarball for this bundle to use for deployment from the oci compliant github container registry connected to this repo [here](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/pkgs/container/uds-bundle%2Fsoftware-factory-nutanix). You can also deploy the bundle directly from the oci registry if you are in a connected environment.

## uds-config.yaml
Once you have the bundle where you need or have access to it via oci, you can then set up a `uds-config.yaml` configuration for your environment. This configuration will be used during deployment.

Below are the example configurations used in this project to configure deploy time variables for the zarf packages in the bundle.
- [uds-config.yaml](uds-config/dev-cluster/uds-config.yaml) Example of our nutanix Dev cluster config
- [uds-config.yaml](uds-config/test-cluster/uds-config.yaml) Example of our nutanix Test cluster config

There will be sensitive values you will need to update before deployment. You can search `replace-me` in the above `uds-config.yaml` files for quick reference sensitive values needing updated.

## Certs
Certs for the tenant and admin gateways should be provided via `uds-config.yaml` variables:
* TENANT_CERT
* TENANT_KEY
* ADMIN_CERT
* ADMIN_KEY

You can reference [this](uds-config/dev-cluster/uds-config.yaml) example config to see how to set these.
## High Level Steps
You can follow the breadcrumbs starting at the [Makefile](Makefile) target `make all/dev-cluster`. This Makefile downloads configured versions of zarf and uds to the build directory, places the `uds-config.yaml` and `deploy-dubbd-values.yaml` in that build directory and performs the deploy command from there. Steps numbered below. Or follow along in the Makefile.

These breadcrumbs will show you how to:
1) download the tools you need like zarf and uds.
```bash
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
```
You can also use brew to install zarf and uds-cli
```bash
brew tap defenseunicorns/tap && brew install uds && brew install zarf
```
2) build all the zarf packages that support this bundle
1) build the bundle itself
1) place the `uds-config.yaml` in the directory where the deployment will take place
1) deploy the software factory.
