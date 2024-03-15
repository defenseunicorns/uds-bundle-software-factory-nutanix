# uds-bundle-software-factory-nutanix
The UDS Software Factory (SWF) bundle can be used to deploy an opinionated kubernetes based devsecops stack and development environment.
The full list of packages and dependencies installed by the bundle (and an assumed underlying environment) can be [viewed here](docs/packages-and-dependencies.md).

> NOTE: this project is young and rapidly iterating, stay up to date on changes by subscribing to release notifications

## Developer Info
[DEVELOPMENT_MAINTENANCE.md](docs/DEVELOPMENT_MAINTENANCE.md)

## Installation ("quickstart")
Once the below [Prerequisites](#prerequisites) are met, these are the steps to deploy.
1) Gather your files in your working directory. Bundle tarball can be referenced via OCI or downloaded for local use.
  - uds-config.yaml [Instructions on creating this file](#Configuration)
  - uds-bundle-software-factory-nutanix-amd64-0.x.x.tar.zst [Instructions on OCI reference usage](#deployment). [Instructions on local reference](#(optional)-local-deployment-reference)
2) Deploy the bundle with the above files in your working directory by [following these instructions](#deployment)

### Prerequisites
**Tools**:
* [uds version v0.9.4](https://github.com/defenseunicorns/uds-cli/tree/v0.9.4)
- `sudo curl -sL https://github.com/defenseunicorns/uds-cli/releases/download/v0.9.4/uds-cli_v0.9.4_Linux_amd64`
* (OPTIONAL) [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* (OPTIONAL) [helm](https://github.com/helm/helm)

**Infrastructure**:
* Kubernetes cluster
* Access to the cluster with enough privilege to deploy
* A valid domain
  > NOTE: `*.bigbang.dev` may be used for demonstration and test deployments.
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
* Object Storage with provisioned buckets (expand for details).
These are the default bucket names. Gitlab allows you to add a suffix in your `uds-config.yaml`, so reflect that if you configure a suffix. Also, Velero and Mattermost allow you to configure your bucket name in your `uds-config.yaml`. Reflect that if you configure those differently then the below defaults.
  <details>
    <summary> Velero </summary>

    * velero-backups
  </details>
  <details>
    <summary> Gitlab </summary>

    * uds-gitlab-artifacts
    * uds-gitlab-backups
    * uds-gitlab-ci-secure-files
    * uds-gitlab-dependency-proxy
    * uds-gitlab-lfs
    * uds-gitlab-mr-diffs
    * uds-gitlab-packages
    * uds-gitlab-pages
    * uds-gitlab-terraform-state
    * uds-gitlab-uploads
    * uds-gitlab-registry
    * uds-gitlab-tmp
  </details>
  <details>
    <summary> Mattermost </summary>

    * mattermost-bucket
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
* Copy an example configuration from [config/dev-cluster/uds-config.yaml](config/dev-cluster/uds-config.yaml) to your working directory
* Update the config according to your environment taking care to set:
  * domain variables
  * certificate values
  * bucket names and credentials
  * database names and credentials

> NOTE: The config must be named `uds-config.yaml` and either be present in your working directory or have the environment variable UDS_CONFIG set to its location at deploy time

### Deployment
Select a target version number and gather the OCI image reference [from the packages page](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-bundle-software-factory-nutanix). With the above prerequisites and configuration complete, you can deploy the bundle directly via OCI:
```
uds deploy oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.1.x --architecure amd64 --confirm
```

### (OPTIONAL) Local Deployment Reference
Situationally, it may be useful to download the deployment artifact so that it may be referenced offline. This can be accomplished by first downloading the target release:
```
uds pull oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.1.x --architecture amd64
```

And subsequently deploying from the local file:
```
uds deploy uds-bundle-software-factory-nutanix-amd64-0.1.4.tar.zst --confirm
```

## Additional Notes
You can reference the uds tasks in this project to learn how to build and deploy.

```bash
# List the available tasks to run
uds run --list

# Run the create-bundle task
uds run create-bundle

# Run the deploy-bundle-to-dev task
uds run deploy-bundle-to-dev

# Run the deploy-bundle-to-test task
uds run deploy-bundle-to-test
```

