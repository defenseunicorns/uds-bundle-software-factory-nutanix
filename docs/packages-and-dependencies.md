# Packages

The UDS Software Factory (SWF) bundle is made up of many components and installs many software packages. Additionally, there are infrastructure dependencies for managing and deploying Kubernetes itself, not all of which are contained within this repo. However, in order to present as much context as possible with regard to dependencies, we will attempt to outline all of them in a comprehensive list categorized by installation source.

> NOTE that external dependencies such as operating system packages and STIG application are based on assumptions about the environment. They are intended to be exemplary and may need to be adjusted/updated based on your ACTUAL system.

## CLI Tools
This list covers tools which would be required on a developer machine in order to stand up or maintain a deployment of UDS SWF.

| Tool | Version | Description |
|----|----|----|
| [OpenTofu](https://github.com/opentofu/opentofu) | v1.7.1 | An Infrastructure As Code (IAC) tool for managing the deployment of virtual resources (VMs, databases, object storage) within Nutanix |
| [UDS](https://github.com/defenseunicorns/uds-cli) | v0.16.0 | A custom tool for automating and simplifying the management of multiple Zarf deployments in one environment |

## Operating System Package Installs
This list covers tools and packages installed in the Operating System of the virtual machines allocated to run Kubernetes. This list is obviously not exhaustive, but instead covers what is being added to the base STIG'd image.

| Package | Version | Description |
|----|----|----|
| [rke2](https://github.com/rancher/rke2/releases/) | v1.29.6+rke2r1 | A Kubernetes distribution provided by Rancher, focused on security compliance for Government workloads |
| [eks-d](https://github.com/aws/eks-distro/releases/) | v1.29.6-eks-c025470 | A Kubernetes distribution provided by AWS |
| [iptables](https://linux.die.net/man/8/iptables) | v1.8.4 | A linux tool for managing local IPv4 packet filtering and NAT routing |
| [postgres14](https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm) | 14.10 | Database server required as part of initial setup |
| [lvm2](https://gitlab.com/lvmteam/lvm2) | 2.03.14(2)-RHEL8 | Logical volume management tool needed by rook/ceph |
| [rke2-selinux](https://github.com/rancher/rke2-selinux) | 0.14-1.el8 | Package needed by RKE2 for systems running selinux |
| [postgis33_14](https://postgis.net/docs/manual-3.3/) | 3.3.5-1PGDG.rhel8 | Postgres extension used for geoggraphical data needed by GitLab |

## Ansible Playbooks // Collections
The following are Ansible playbooks and collections run on the host VMs during the image building process, installing further dependencies and applying STIG's.

| Name | Version | Description |
|----|----|----|
| [community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html) | 7.5.1 | A collection of Ansible modules and tools used for orchistrating STIG application during the VM image build process |
| [ansible.posix](https://docs.ansible.com/ansible/latest/collections/ansible/posix/index.html) | 1.5.4 | Collection of Ansible modules for interacting with POSIX based operating systems such as RHEL; used during the image build process |
| [RHEL 8 STIGs](https://public.cyber.mil/stigs/supplemental-automation-content/) | 1.12 | Automated application of RHEL 8 STIG requirements used during the image build process. |

## UDS Software Factory Bundle
The UDS Software Factory Bundle (SWF) is a collection of Zarf packages which include the full set of tooling and applications installed into the cluster to create a secure software development environment. A portion of the tooling (Defense Unicorns UDS-Core) has been expanded into a separate section below for clarity. SWF installs the following:

| Name | Package Version (internal) | Application Version | Description |
|----|----|----|----|
| [Zarf Init](https://github.com/zarf-dev/zarf/pkgs/container/packages%2Finit) | v0.39.0 | v0.39.0 | Zarf Init Package used to initialize zarf in the cluster |
| [Nutanix CSI](https://portal.nutanix.com/page/documents/details?targetId=CSI-Volume-Driver-v2_6:CSI-Volume-Driver-v2_6) | v3.0.0 | v3.0.0 | Nutanix CSI package |
| [MetalLB](https://github.com/defenseunicorns/uds-capability-metallb) | 0.0.5 | v0.13.12 | Tool for providing load balancer capabilities for ingress into a Kubernetes deployment |
| [uds-core](https://github.com/defenseunicorns/uds-core) | 0.29.0 | N/A | [DESCRIPTION BELOW](#UDS-Core) |
| [Valkey](https://github.com/defenseunicorns/uds-package-valkey) | v7.2.6-uds.0-upstream | 7.2.6 | A key-value store used as a data backend for several applications in the stack |
| [Gitlab](https://github.com/defenseunicorns/uds-package-gitlab) | v17.2.9-uds.0-registry1 | 17.2.9 | A source control management tool used in the software development lifecycle for storing, updating, building and deploying custom software |
| [Gitlab Runner](https://github.com/defenseunicorns/uds-package-gitlab-runner) | 17.1.0-uds.1-registry1 | v17.1.0 | A counterpart to Gitlab (above) in which automated software builds, tests and deployments are executed |
| [Sonarqube](https://github.com/defenseunicorns/uds-package-sonarqube) | 10.7.0-uds.0-registry1 | 10.7.0-community | A code inspection tool used during automated pipelines to evaluate security considerations of custom software and packaged images |
| [Jira](https://github.com/defenseunicorns/uds-package-jira) | 1.22.0-uds.0-registry1 | 10.0.1 | A collaboration tool used for team management and task organization |s
| [Confluence](https://github.com/defenseunicorns/uds-package-confluence) | 1.20.0-uds.4-registry1 | 9.0.3 | A knowledge management tool used by teams to organize information |
| [Mattermost](https://github.com/defenseunicorns/uds-package-mattermost) | 10.0.0-uds.1-registry1 | 10.0.0 | An instance of Mattermost, a self-hosted chat and collaboration platform |
| [Nexus](https://github.com/defenseunicorns/uds-package-nexus) | 3.72.0-uds.0-registry1 | 3.72.0 | An artifact repository used for storing compiled application libraries, packages, images and other such artifacts |
| [cert-manager](https://cert-manager.io/) | 0.0.1 | 1.16.1 | Tool for automating management of in-cluster certificates |
| [trust-manager](https://cert-manager.io/docs/trust/trust-manager/) | 0.0.1 | v0.12.0 | Tool for automating creation and distribution of CA trust bundles |

## UDS Core
 UDS Core is a collection of tools that provide administrative capabilities such as deployment automation, centralized logging, monitoring, alerting and runtime security to a kubernetes cluster. The following applications and tools are installed:

| Package | Version | Description |
|----|----|----|
| [Istio](https://istio.io/latest/) | 1.23.2 | A package detailing the configuration of the deployed service mesh -- used by the operator to apply the desired state in the cluster |
| [Loki](https://grafana.com/oss/loki/) | 3.2.0 | A Grafana product for aggregating and querying log data |
| [Vector](https://vector.dev/) | 0.41.1 | A logging daemon installed on each cluster node to capture logs from the host and all cluster workload processes. Logs are shipped to Loki |
| [Prometheus](https://prometheus.io/) | 2.54.1 | A product for storing and querying time series based data such as system performance metrics (CPU/MEM usage) |
| [Grafana](https://github.com/grafana/grafana) | 11.2.2 | A Grafana product to provide a frontend interface to display and query performance information from Prometheus, log data from Loki, and request tracing information from Tempo |
| [Neuvector](https://www.suse.com/neuvector/) | 5.3.4 | A kubernetes security suite that provides CVE scanning for hosts and images, as well as runtime security monitoring and protection |
| [Velero](https://repo1.dso.mil/big-bang/product/packages/velero) | 1.14.1 | A tool for orchistrating backups of cluster state and storage |
| [Authservice](https://github.com/istio-ecosystem/authservice) | 1.0.2 | A tool for simplifying and automating auth workflows via Istio integration |
| [Metrics Server](https://github.com/kubernetes-sigs/metrics-server) | 0.7.2 | A container metrics aggregation and exporter for kubernetes |
| [Pepr](https://pepr.dev/) | 0.37.2 | Declarative automation for managing deployments and security policy enorcement |
| [Keycloak](https://github.com/defenseunicorns/uds-core) | 25.0.6 | An identity and access management (IDAM) tool used to authenticate users for access to applications |
| [uds-identity-config]() | v0.6.3 | UDS Identity (Keycloak) Config image used by UDS Identity |
