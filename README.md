# uds-bundle-software-factory-nutanix

This is a UDS Software Facotry bundle meant to be deployed on a Nutanix-based K8s cluster. This is not a [Supported Environment](https://uds.defenseunicorns.com/reference/uds-core/distribution-support/) but UDS should be compatible with this setup, and this bundle includes configuration changes to help it work on Nutanix.

Bundle developers see [development.md](docs/development.md).

## Installing on Nutanix

### 1. Install Required Tools

- [UDS CLI](https://github.com/defenseunicorns/uds-cli/tree/v0.16.0). This links to version 0.16.0 which is what the bundle is tested with but it should work with most nearby versions. The binary is here: <https://github.com/defenseunicorns/uds-cli/releases/download/v0.16.0/uds-cli_v0.16.0_Linux_amd64>

**Optionally**, the following tools are baked into the UDS CLI via Zarf (`uds zarf tools`) already are easier to use if installed directly:

- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [helm](https://helm.sh/docs/intro/install/)
- [k9s](https://k9scli.io/topics/install/) also availible via the command `uds monitor`

### 2. Get the Bundle

- The bundle you would like to install.
  - You can download the latest in your browser from [Defense Unicorn's published packages](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-bundle-software-factory-nutanix)
  - You can pull it via the same protocol used to push/pull docker images: `uds pull oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix-rke2:0.4.3 --architecture amd64`
  - You can also reference it by it's "docker name" (OCI image URL) at deploy time with the same command above, `pull` switched to `deploy` and UDS will pull it and deploy it. This is less relevant to air-gapped installs unless you're pushing the bundle to a high-side docker registry before install (which isn't a bad idea).

### 3. Customize Configuration via `uds-config.yaml`

Create your own `uds-config.yaml` file. You can start from the reference file in the `config/` directory.

You will continue to update this uds-config.yaml file with environment-dependent variables as you go through these instructions. You can also review it now for familiarity.

### 4.  sCreate Infrastructure Dependencies

This bundle requires pre-existing s3 buckets and external postgres databases. The addresses and credentials are passed in via the `uds-config.yaml` file at deploy time. 

#### A. Create the Kubernetes Cluster

Goes without saying, but the k8s cluster must already exist in Nutanix, and you must have admin access to it.

#### B. Provide a Domain, DNS sub-domain support (wildcard CNAME preferable), TLS certs

During bundle development and testing, we use the `*.bigbang.dev` domain (which is owned by a Unicorn who used to work for Platform One). You will need to setup routing to `*.your-domain.com`.

You also need TLS certs signed by a locally trusted CA for the applications. A wildcard cert is convenient, but many security teams prefer a cert per valid sub-domain. Here is a list of all required sub-domains:

	- `confluence.your.domain`
	- `gitlab.your.domain`
	- `*.pages.your.domain` **Note:** strongly recommend a wildcard here as it'd be toilsome to keep up with user behavior here.
	- `registry.your.domain`
	- `gitlab.your.domain`
	- `jira.your.domain`
	- `keycloak.your.domain`
	- `kiali.your.domain`
	- `chat.your.domain`
	- `grafana.your.domain`
	- `neuvector.your.domain`
	- `nexus.your.domain`
  - `*.nexus.your.domain` 
  
    > **Note:** if you create a cert per nexus subdomain instead of a wildcard cert (subdomains are docker registries) see [docs/nexus.md](docs/nexus.md) to make sure you update the tenant gateway and other relevant uds-config variables correctly. It was tested with a wildcard cert. This author can't promise the current configuration would allow multiple individual certs to be inserted into the right places.
	
  - `sonarqube.your.domain`
  - `tracing.your.domain`

Update the domain and TLS cert values in your `uds-config.yaml` file.

#### C. Provision S3-like Object Storage

There are the default bucket names in the default `uds-config.yaml` file. If you choose to deviate from these names know:
- Gitlab only allows you to add a suffix. 
- Loki, Velero and Mattermost don't care what you name the S3 buckets.

Reference the `uds-config.yaml` file you created as you go to be sure you're creating/have created buckets by the intended names.

#### D. Create the Postgres Databases.

The following applications require an external database:
- Keycloak
- Gitlab
- Sonarqube
- Jira
- Confluence
- Mattermost
- Nexus

Update your `uds-config.yaml` file with the correct credentials and connection URLs.

#### E. Enable Nutanix CSI

This bundle utilizes the Nutanix CSI Helm chart for persistent storage. Before the bundle can be deployed the following needs to be created:
1. Prism Element user and password for the CSI provider to connect to Prism Element. Update your `uds-config.yaml` file with the user credentials and the Prism Element IP/Hostname.
2. Nutanix Storage Container for RWO persistent volumes. Add the storage container name to the `uds-config.yaml`.
3. Nutanix File Server for RWX persistent volumes. **Be sure to configure the DNS records that it asks for.** Put the File Server name as it appears in Prism Element into your `uds-config.yaml`.

> NOTE: User/password and Nutanix File server must be configured in Prism _Element_ not Prism _Central_.

### 5. Deploy

This is the easy step.

1. Set `KUBECONFIG` to point to the kubernetes kubeconfig file.
2. Set `UDS_CONFIG` to point at your `uds-config.yaml` file.
3. Run `uds deploy <package file name or OCI url> --architecure amd64`.

If you got the config right the first time, then congratulations! The whole thing is now running. If murphy struck, see the [developer docs](docs/development.md) for guidance on efficiently testing configuration changes, setting up multiple clusters in a way that fits with the uds tasks, and other notes.
