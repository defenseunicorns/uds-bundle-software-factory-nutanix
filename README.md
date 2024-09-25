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
* [uds version v0.16.0](https://github.com/defenseunicorns/uds-cli/tree/v0.16.0)
- `sudo curl -sL https://github.com/defenseunicorns/uds-cli/releases/download/v0.16.0/uds-cli_v0.16.0_Linux_amd64`
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
These are the default bucket names. Gitlab allows you to add a suffix in your `uds-config.yaml`, so reflect that if you configure a suffix. Also, Loki, Velero and Mattermost allow you to configure your bucket name in your `uds-config.yaml`. Reflect that if you configure those differently then the below defaults.
  <details>
    <summary> Loki </summary>

    * loki-chunks-bucket
    * loki-ruler-bucket
    * loki-admin-bucket
  </details>
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

**Storage**

This bundle utilizes the Nutanix CSI Helm chart for persistent storage. Before the bundle can be deployed the following needs to be configured:
* Prism Element user and password for the CSI provider to connect to Prism Element. Username, password, and Prism Element IP/Hostname will need passed to uds-config.yaml.
* Nutanix Storage Container for RWO persistent volumes. Can either be a new container configured specifically for cluster storage, or an existing container depending on your needs/desires. Storage container name will need passed to uds-config.yaml.
* Nutanix File Server configured to use for RWX persistent volumes. Make sure to configure the DNS records that it asks you to make. File Server name as it appears in Prism Element will need passed to uds-config.yaml.

> NOTE: User/password and Nutanix File server must be configured in Prism Element not Prism Central.

### Configuration
Deployment configuration is managed via a `uds-config.yaml` file in the deployment directory. Some values in the configuration will be sensitive, **we do not recommend checking this into source control in its entierty**. Best practice would involve either storing the configuration in an external secrets manager (like Vault), or managing deployments via CD and generating the config file dynamically at deploy time using CD managed secrets.

For demonstration purposes, you can setup a local configfile as follows:
* Copy an example configuration from [config/uds-config.yaml](config/uds-config.yaml) to your working directory
* Update the config according to your environment taking care to set:
  * domain variables
  * init variables for Nutanix csi
  * certificate values
  * bucket names and credentials
  * database names and credentials

> NOTE: The config must be named `uds-config.yaml` and either be present in your working directory or have the environment variable UDS_CONFIG set to its location at deploy time

### Deployment
Select a target version number and gather the OCI image reference [from the packages page](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-bundle-software-factory-nutanix). With the above prerequisites and configuration complete, you can deploy the bundle directly via OCI:
```
uds deploy oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.x.x --architecure amd64 --confirm
```

### (OPTIONAL) Local Deployment Reference
Situationally, it may be useful to download the deployment artifact so that it may be referenced offline. This can be accomplished by first downloading the target release:
```
uds pull oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix:0.x.x --architecture amd64
```

And subsequently deploying from the local file:
```
uds deploy uds-bundle-software-factory-nutanix-amd64-0.x.x.tar.zst --confirm
```

>NOTE: There is a new default terminal user interface for UDS. When running a deploy from a pipeline you can choose to have the normal terminal output by using the `--no-tea` flag with your uds deploy.
```
uds deploy uds-bundle-software-factory-nutanix-amd64-0.x.x.tar.zst --confirm --no-tea
```
## Custom Keycloak Plugin
The Keycloak installation provided as part of UDS Core loads themes and plugins from an init-container. You can optionally provide custom JARs at deploytime simply by adding them to the directory where you run `uds deploy`. This will result in a custom Zarf package being built locally (to include your custom JAR).

> ANY CUSTOM JAR YOU ADD AT DEPLOY TIME WILL NOT BE INCLUDED IN THE BUNDLE SBOM

## Additional Notes
You can reference the uds tasks in this project to learn how to build and deploy.

```bash
# List the available tasks to run
uds run --list

# Run the create-bundle task
uds run create-bundle
```

To force terminate a namespace that is hanging, try this. This state is often brought about during development by deleting the metrics
server before everything else is gone. The namespaces then hang as they're unable to talk to it.

```bash
kubectl proxy & # Only run this once
destroy-ns () {
  NAMESPACE="${1}"
  kubectl get namespace "${NAMESPACE}" -o json | jq '.spec = {"finalizers":[]}' > temp.json
  curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize
}

# For every namespace you want to delete:
destroy-ns <namespace>

# So we don't dirty the git history
rm temp.json
```