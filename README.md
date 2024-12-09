# UDS Bundled Software Factory for Nutanix

This is a UDS Software Factory bundle intended to be deployed on an RKE2 K8s cluster running in Nutanix. It has been tested using RKE2 clusters deployed with the [Nutanix RKE2 module](https://github.com/defenseunicorns/delivery-nutanix-iac/tree/main/modules/rke2).

A list of included applications can be found [here](docs/packages-and-dependencies.md).

Bundle developers see [development.md](docs/development.md).

## Installing on Nutanix

For further insight into the underlying infrastructure including the RKE2 cluster, see [the Nutanix IAC repo](https://github.com/defenseunicorns/delivery-nutanix-iac/tree/main). In particular the [UDS SWF pre-requisites documentation](https://github.com/defenseunicorns/delivery-nutanix-iac/blob/main/docs/uds-swf-prereqs.md). Note that as this bundle continues to be improved the above document may not perfectly capture the required buckets and databases. Also, buckets cannot be created in Nutanix Objects via Terraform/Tofu. Those must be created via click-ops.

### 1. Install Required Tools

**To Deploy** (required):
- [UDS CLI](https://github.com/defenseunicorns/uds-cli/tree/v0.16.0). This links to version 0.16.0 which is what the bundle is tested with but it should work with most nearby versions. The binary is here: <https://github.com/defenseunicorns/uds-cli/releases/download/v0.16.0/uds-cli_v0.16.0_Linux_amd64>


**To Interact with Cluster/Debug** (optional). These tools are also baked into the UDS CLI via Zarf (`uds zarf tools`) but are easier to use if installed directly:

- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [helm](https://helm.sh/docs/intro/install/)
- [k9s](https://k9scli.io/topics/install/) also available via the command `uds monitor`

### 2. Get the Bundle

Get the bundle you would like to install:
  - You can download the latest in your browser from [Defense Unicorn's published packages](https://github.com/orgs/defenseunicorns/packages?repo_name=uds-bundle-software-factory-nutanix)
  - You can pull it via the same protocol used to push/pull container images:
<!--x-release-please-start-version-->
    ```bash
    uds pull oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix-rke2:0.5.3 --architecture amd64`
    ```
<!--x-release-please-end-->
  - You can also reference it by it's "docker name" (OCI image URL) at deploy time with the a similar command to the one above.
<!--x-release-please-start-version-->
    ```bash
    uds deploy oci://ghcr.io/defenseunicorns/uds-bundle/software-factory-nutanix-rke2:0.5.3 --architecture amd64`
    ```
<!--x-release-please-end-->

### 3. Customize Configuration via `uds-config.yaml`

Create your own `uds-config.yaml` file. You can start from the reference file in the `config/` directory. Note it the default yaml file includes comments to point you at particular docs (such as [docs/nexus.md](docs/nexus.md)) to guide you in understanding and configuring some of the more challenging values.

Don't worry about the domain, database, TLS, and object store related values at this time. They will be addressed in the following sections.

### 4. Create Infrastructure Dependencies

This bundle requires pre-existing s3 buckets and external postgres databases. The addresses and credentials are passed in via the `uds-config.yaml` file at deploy time.

#### A. Create the Kubernetes Cluster

Goes without saying, but the k8s cluster must already exist in Nutanix, and you must have admin access to it. We create ours with Terraform/Tofu [here](https://github.com/defenseunicorns/delivery-nutanix-iac/tree/main). See especially the [RKE2 module](https://github.com/defenseunicorns/delivery-nutanix-iac/tree/main/modules/rke2) and [module documentation](https://github.com/defenseunicorns/delivery-nutanix-iac/blob/main/docs/rke2-module.md).

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

    > **Note:** if you create your cert with a SAN per nexus subdomain instead of a wildcard SAN (need one subdomain per image registry) see [docs/nexus.md](docs/nexus.md) to make sure you update the tenant gateway and other relevant uds-config variables correctly. It was tested with a wildcard SAN on the tenant cert which allowed us to create 1-n registries without performing a bundle deploy to reconfigure networking.

  - `sonarqube.your.domain`
  - `tracing.your.domain`

Update the domain and TLS cert values in your `uds-config.yaml` file.

#### C. Provision S3 Compatible Object Storage

There are the default bucket names in the default `uds-config.yaml` file. If you choose to deviate from these names know:
- Gitlab only allows you to add a suffix.
- Loki, Velero and Mattermost buckets can be named anything

Reference the `uds-config.yaml` file you created as you go to be sure you're creating/have created buckets by the intended names. For a list of UDS config variables to be sure you update, see [docs/object-store-creation-and-configuration.md](docs/object-store-creation-and-configuration.md).

#### D. Create the Postgres Databases.

The following applications require an external database:
- Keycloak
- Gitlab
- Sonarqube
- Jira
- Confluence
- Mattermost
- Nexus

Update your `uds-config.yaml` file with the correct credentials and connection URLs. For a list of UDS config variables to be sure you update, see [docs/database-creation-and-configuration.md](docs/database-creation-and-configuration.md).

You can review the Terraform module we use for provisioning postgres databases with Nutanix Database Service in our [delivery-nutanix-iac repo](https://github.com/defenseunicorns/delivery-nutanix-iac/tree/main/modules/ndb-pg-db).

#### E. Enable Nutanix CSI

This bundle utilizes the Nutanix CSI Helm chart for persistent storage. It needs Nutanix resources set up ahead of time.

1. Prism Element user and password for the CSI provider to connect to Prism Element. Update your `uds-config.yaml` file with the user credentials and the Prism Element IP/Hostname.
2. Prism Central user and password for the CSI provider to connect to Prism Central. Update your `uds-config.yaml` file with the user credentials and the Prism Central IP/Hostname.
3. Nutanix Storage Container for RWO persistent volumes. Add the storage container name to the `uds-config.yaml`.
4. Nutanix File Server for RWX persistent volumes. **Be sure to configure the DNS records that it asks for.** Put the File Server name as it appears in Prism Element into your `uds-config.yaml`.

> NOTE: User/password and Nutanix File server must be configured in Prism _Element_ not Prism _Central_.

### 5. Deploy

This is the easy step.

1. Set `KUBECONFIG` to point to the kubernetes kubeconfig file.
2. Set `UDS_CONFIG` to point at your `uds-config.yaml` file.
3. Run `uds deploy <package file name or OCI url> --architecure amd64`.

If you got the config right the first time, then congratulations! The whole thing is now running. If murphy struck, see the [developer docs](docs/development.md) for guidance on efficiently testing configuration changes, setting up multiple clusters in a way that fits with the uds tasks, and other notes.
