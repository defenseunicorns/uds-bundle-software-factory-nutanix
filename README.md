# uds-bundle-software-factory-nutanix
The UDS Software Factory (SWF) bundle can be used to deploy an opinionated kubernetes based devsecops stack and development environment.
The full list of packages and dependencies installed by the bundle (and an assumed underlying environment) can be [viewed here](docs/packages-and-dependencies.md).

> NOTE: this project is young and rapidly iterating, stay up to date on changes by subscribing to release notifications

## Developer Info
[DEVELOPMENT_MAINTENANCE.md](docs/DEVELOPMENT_MAINTENANCE.md)

## Installation ("quickstart")
### Prerequisites
**Tools**:
* [zarf](https://github.com/defenseunicorns/zarf)
* [uds](https://github.com/defenseunicorns/uds-cli)
* (OPTIONAL) [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* (OPTIONAL) [helm](https://github.com/helm/helm)

> NOTE: Zarf must be accessible on the user's PATH

**Infrastructure**:
* Kubernetes cluster
* Access to the cluster with enough privilage to deploy 
* A valid domain 
  > NOTE: `*.bigbang.dev` may be used for demomonstration and test deployments.
* Wildcard certificates to cover your domain (alternatively, expand for full SAN list)
  <details>
    <summary>Individual SAN list </summary>
	
	* `confluence.your.domain`
	* `gitlab.your.domain`
	* `*.pages.your.domain`
	* `registry.your.domain`
	* `gitlab.your.domain`
	* `jira.your.domain`
	* `keycloak.your.domain`
	* `kiali.your.domain`
	* `chat.your.domain`
	* `grafana.your.domain`
	* `neuvector.your.domain`
	* `nexus.your.domain`
	* `sonarqube.your.domain`
    * `tracing.your.domain`
  </details>

  > NOTE: If using the example domain (`*.bigbang.dev`), a valid corresponding certificate and key can be found [in the Platform1 Big Bang repo](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/ingress-certs.yaml?ref_type=heads).
* Object Storage with provisioned buckets (expand for details)
  <details>
    <summary> Velero </summary>

    * velero-backups
  </details>
  <details>
    <summary> Gitlab </summary>
	
    * gitlab-artifacts
    * gitlab-backups
    * gitlab-ci-secure-files
    * gitlab-dependency-proxy
    * gitlab-lfs
    * gitlab-mr-diffs
    * gitlab-packages
    * gitlab-pages
    * gitlab-terraform-state
    * gitlab-uploads
    * gitlab-registry
    * gitlab-tmp
  </details>
  <details>
    <summary> Mattermost </summary>

    * mattermost-objects
  </details>
* Postgres databases (expand for details):
  <details>
    <summary> Full list of databases </summary>

  * Keycloak
  * Gitlab
  * Sonarqube
  * Jira
  * Confluence
  * Mattermost
  * Nexus
  </details>

> NOTE: All database and object storage credentials must be provided via username and password in the uds-config.

### Configuration
Deployment configuration is managed via a `uds-config.yaml` file in the deployment directory. Some values in the configuration will be sensitive, **we do not recommend checking this into source control in its entierty**. Best practice would involve either storing the configuration in an external secrets manager (like Vault), or managing deployments via CD and generating the config file dynamically at deploy time using CD managed secrets.

For demonstration purposes, you can setup a local configfile as follows:
* Copy an example configuration from `uds-config/test-cluster` to your working directory
* Update the config according to your environment taking care to set:
  * domain variables
  * certificate values
  * bucket names and credentials
  * database names and credentials

> NOTE: the config must be named `uds-config.yaml` and be present in your working directory at deploy time

### Deployment
Select a target version number and gather the OCI image reference [from the packages page](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-bundle-software-factory-nutanix). With the above prerequisites and configuration complete, you can deploy the bundle directly via OCI:
```
uds deploy oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.1.4-amd64 --confirm
```

### (OPTIONAL) Local Deployment Reference
Situationally, it may be useful to download the deployment artifact so that it may be referenced offline. This can be accomplished by first downloading the target release:
```
uds pull oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.1.4-amd64
```

And subsequently deploying from the local file:
```
uds deploy uds-bundle-software-factory-nutanix-amd64-0.1.4.tar.zst --confirm
```

## Additional Notes
For development and testing (both locally and in CI) we have included a Makefile to simplify common tasks. You can follow the breadcrumbs starting at the [Makefile](Makefile) target `make all/dev-cluster`. This Makefile downloads configured versions of zarf and uds to the build directory, places the `uds-config.yaml` and `deploy-dubbd-values.yaml` in that build directory and performs the deploy command from there. Steps numbered below. Or follow along in the Makefile.

These targets will show you how to:
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
