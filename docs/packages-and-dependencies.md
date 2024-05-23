# Packages

The UDS Software Factory (SWF) bundle is made up of many components and installs many software packages. Additionally, there are infrastructure dependencies for managing and deploying Kubernetes itself, not all of which are contained within this repo. However, in order to present as much context as possible with regard to dependencies, we will attempt to outline all of them in a comprehensive list categorized by installation source.

> NOTE that external dependencies such as operating system packages and STIG application are based on assumptions about the environment. They are intended to be exemplary and may need to be adjusted/updated based on your ACTUAL system.

## CLI Tools
This list covers tools which would be required on a developer machine in order to stand up or maintain a deployment of UDS SWF.

| Tool | Version | Description |
|----|----|----|
| [terraform](https://github.com/hashicorp/terraform) | v1.6.4 | An Infrastructure As Code (IAC) tool for managing the deployment of virtual resources (VMs, databases, object storage) within Nutanix |
| [UDS](https://github.com/defenseunicorns/uds-cli) | v0.10.4 | A custom tool for automating and simplifying the management of multiple Zarf deployments in one environment |

## Operating System Package Installs
This list covers tools and packages installed in the Operating System of the virtual machines allocated to run Kubernetes. This list is obviously not exhaustive, but instead covers what is being added to the base STIG'd image.

| Package | Version | Description |
|----|----|----|
| [rke2](https://github.com/rancher/rke2/releases/) | v1.27.6+rke2r1 | A Kubernetes distribution provided by Rancher, focused on security compliance for Government workloads |
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
| [Nutanix CSI Driver Init](https://portal.nutanix.com/page/documents/details?targetId=CSI-Volume-Driver-v2_6:CSI-Volume-Driver-v2_6) | v0.33.0 | v2.6.8 | A zarf component installed in the cluster for orchestrating further deployment of Zarf based packages |
| [MetalLB](https://github.com/defenseunicorns/uds-capability-metallb) | 0.0.5 | v0.13.12 | Tool for providing load balancer capabilities for ingress into a Kubernetes deployment |
| [uds-core](https://github.com/defenseunicorns/uds-core) | 0.22.0 | N/A | [DESCRIPTION BELOW](#UDS-Core) |
| [Redis](https://github.com/defenseunicorns/uds-package-dependencies) | 0.0.2 | 7.0.12 | A key-value store used as a data backend for several applications in the stack |
| [Gitlab](https://github.com/defenseunicorns/uds-package-gitlab) | 16.11.1-uds.0-registry1 | 16.11.1 | A source control management tool used in the software development lifecycle for storing, updating, building and deploying custom software |
| [Gitlab Runner](https://github.com/defenseunicorns/uds-package-gitlab-runner) | 16.11.0-uds.0-registry1 | v16.11.0 | A counterpart to Gitlab (above) in which automated software builds, tests and deployments are executed |
| [Sonarqube](https://github.com/defenseunicorns/uds-package-sonarqube) | 8.0.3-uds.6-registry1 | 9.9.3-community | A code inspection tool used during automated pipelines to evaluate security considerations of custom software and packaged images |
| [Jira](https://github.com/defenseunicorns/uds-package-jira) | 1.19.0-uds.0-registry1 | 9.15.1 | A collaboration tool used for team management and task organization |
| [Confluence](https://github.com/defenseunicorns/uds-package-confluence) | 1.18.0-uds.0-registry1 | 8.8.0 | A knowledge management tool used by teams to organize information |
| [Mattermost](https://github.com/defenseunicorns/uds-package-mattermost) | 9.7.2-uds.0-registry1 | 9.7.2 | An instance of Mattermost, a self-hosted chat and collaboration platform |
| [Nexus](https://github.com/defenseunicorns/uds-package-nexus) | 3.66.0-uds.1-registry1 | 3.66.0-02 | An artifact repository used for storing compiled application libraries, packages, images and other such artifacts |

## UDS Core
 UDS Core is a collection of tools that provide administrative capabilities such as deployment automation, centralized logging, monitoring, alerting and runtime security to a kubernetes cluster. The following applications and tools are installed:

| Package | Version | Description |
|----|----|----|
| [Istio](https://istio.io/latest/) | 1.21.2 | A package detailing the configuration of the deployed service mesh -- used by the operator to apply the desired state in the cluster |
| [Loki](https://grafana.com/oss/loki/) | 2.9.6 | A Grafana product for aggregating and querying log data |
| [Promtail](https://grafana.com/docs/loki/latest/send-data/promtail/) | 2.9.6 | A logging daemon installed on each cluster node to capture logs from the host and all cluster workload processes. Logs are shipped to Loki |
| [Prometheus](https://prometheus.io/) | 2.51.2 | A product for storing and querying time series based data such as system performance metrics (CPU/MEM usage) |
| [Grafana](https://github.com/grafana/grafana) | 10.4.2 | A Grafana product to provide a frontend interface to display and query performance information from Prometheus, log data from Loki, and request tracing information from Tempo |
| [Neuvector](https://www.suse.com/neuvector/) | 5.3.2 | A kubernetes security suite that provides CVE scanning for hosts and images, as well as runtime security monitoring and protection |
| [Velero](https://repo1.dso.mil/big-bang/product/packages/velero) | 1.13.2 | A tool for orchistrating backups of cluster state and storage |
| [Authservice](https://github.com/istio-ecosystem/authservice) | 0.5.3 | A tool for simplifying and automating auth workflows via Istio integration |
| [Metrics Server](https://github.com/kubernetes-sigs/metrics-server) | 0.7.1 | A container metrics aggregation and exporter for kubernetes |
| [Pepr](https://pepr.dev/) | 0.31.0 | Declarative automation for managing deployments and security policy enorcement |
| [Keycloak](https://github.com/defenseunicorns/uds-core) | 24.0.4 | An identity and access management (IDAM) tool used to authenticate users for access to applications |
