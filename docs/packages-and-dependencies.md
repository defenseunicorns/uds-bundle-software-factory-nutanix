# Packages

The UDS Software Factory (SWF) bundle is made up of many components and installs many software packages. Additionally, there are infrastructure dependencies for managing and deploying Kubernetes itself, not all of which are contained within this repo. However, in order to present as much context as possible with regard to dependencies, we will attempt to outline all of them in a comprehensive list categorized by installation source.

> NOTE that external dependencies such as operating system packages and STIG application are based on assumptions about the environment. They are intended to be exemplary and may need to be adjusted/updated based on your ACTUAL system.

## CLI Tools
This list covers tools which would be required on a developer machine in order to stand up or maintain a deployment of UDS SWF.

| Tool | Version | Description |
|----|----|----|
| [terraform](https://github.com/hashicorp/terraform) | v1.6.4 | An Infrastructure As Code (IAC) tool for managing the deployment of virtual resources (VMs, databases, object storage) within Nutanix |
| [kubectl](https://github.com/kubernetes/kubectl) | v1.28.4 | Kubernetes management utility and CLI used by cluster admins to interact directly with a Kubernetes cluster |
| [helm](https://github.com/helm/helm) | v3.13.2 | Kubernetes package manager CLI used to review the status of deployments in the cluster |
| [Zarf](https://github.com/defenseunicorns/zarf) | v0.31.4 | A custom tool for packaging and delivering software components (such as gitlab) across an airgap |
| [UDS](https://github.com/defenseunicorns/uds-cli) | v0.5.1 | A custom tool for automating and simplifying the management of multiple Zarf deployments in one environment |

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
The UDS Software Factory Bundle (SWF) is a collection of Zarf packages which include the full set of tooling and applications installed into the cluster to create a secure software development environment. A portion of the tooling (Defense Unicorns Big Bang Distribution) has been expanded into a separate section below for clarity. SWF installs the following:

| Name | Package Version (internal) | Application Version | Description |
|----|----|----|----|
| [Rook Ceph Zarf Init](https://github.com/defenseunicorns/uds-capability-rook-ceph/pkgs/container/uds-capability%2Frook-ceph%2Finit) | v0.31.4-0.1.2 | N/A | A zarf component installed in the cluster for orchestrating further deployment of Zarf based packages |
| [MetalLB](https://github.com/defenseunicorns/uds-capability-metallb/tree/v0.0.4) | 0.0.4 | v0.13.12 | Tool for providing load balancer capabilities for ingress into a Kubernetes deployment |
| [DUBBD](https://github.com/defenseunicorns/uds-package-dubbd) | 0.15.0 | N/A | [DESCRIPTION BELOW](#Defense-Unicorns-Big-Bang-Distribution-(DUBBD)) |
| [Keycloak](https://github.com/defenseunicorns/uds-idam) | 0.1.14 | 21.1.1 | An identity and access management (IDAM) tool used to authenticate users for access to applications |
| [Redis](https://github.com/defenseunicorns/uds-capability-gitlab/tree/main/utils/pkg-deps/gitlab/redis) | 0.0.2 | 7.0.12 | A key-value store used as a data backend for several applications in the stack |
| [Minio](https://github.com/defenseunicorns/uds-capability-gitlab/tree/main/utils/pkg-deps/gitlab/minio) | 0.0.2 | 5.0.13 | An S3 compliant object storage solution backed by in-cluster storage providers. Allows applications to simulate access to cloud based storage against in-cluster resources |
| [Gitlab](https://github.com/defenseunicorns/uds-capability-gitlab/tree/main) | 0.1.15 | 16.6.1 | A source control management tool used in the software development lifecycle for storing, updating, building and deploying custom software |
| [Gitlab Runner](https://github.com/defenseunicorns/uds-capability-gitlab-runner/tree/main) | 0.1.3 | v16.5.0 | A counterpart to Gitlab (above) in which automated software builds, tests and deployments are executed |
| [Sonarqube](https://github.com/defenseunicorns/uds-capability-sonarqube) | 0.1.3 | 9.9.3-community | A code inspection tool used during automated pipelines to evaluate security considerations of custom software and packaged images |
| [Jira](https://github.com/defenseunicorns/uds-capability-jira) | 0.1.4 | 9.12.0 | A collaboration tool used for team management and task organization |
| [Confluence](https://github.com/defenseunicorns/uds-capability-confluence) | 0.1.3 | 8.7.1 | A knowledge management tool used by teams to organize information |
| [Mattermost Operator](https://github.com/defenseunicorns/uds-capability-mattermost-operator) | 0.1.6 | 1.20.1 | A Kubernetes operator installed to manage deployment and configuration of Mattermost instances within the cluster |
| [Mattermost](https://github.com/defenseunicorns/uds-capability-mattermost-operator) | 0.1.7 | 9.2.3 | An instance of Mattermost, a self-hosted chat and collaboration platform |
| [Nexus](https://github.com/defenseunicorns/uds-capability-nexus) | 0.1.5 | 3.62.0-01 | An artifact repository used for storing compiled application libraries, packages, images and other such artifacts |

## Defense Unicorns Big Bang Distribution (DUBBD)
 DUBBD is an opinionated configuration of Platform One's Big Bang product. It is a collection of tools that provide administrative capabilities such as centralized logging, monitoring, alerting and runtime security to a kubernetes cluster. The following applications and tools are installed:

| Package | Version | Description |
|----|----|----|
| [Flux](https://github.com/fluxcd/flux2/releases) | 2.1.1 | A GitOps based manager for scheduling deployments in the cluster |
| [Big Bang](https://repo1.dso.mil/big-bang/bigbang) | 2.17.0 | Big Bang is a suite of DevSecOps tools which can be installed in Kubernetes to help secure, monitor and manage cluster workloads |
| [Kyverno](https://repo1.dso.mil/big-bang/product/packages/kyverno) | 1.10.3 | Kyverno is a policy management engine for Kubernetes used to restrict permissions in the cluster and enforce NIST based security control requirements |
| [Istio Operator](https://repo1.dso.mil/big-bang/product/packages/istio-operator) | 1.19.4 | Kubernetes operator which manages deployments and configuration of the Istio service mesh (in-cluster networking) |
| [Istio Controlplane](https://repo1.dso.mil/big-bang/product/packages/istio-controlplane) | 1.19.4 | A package detailing the configuration of the deployed service mesh -- used by the operator to apply the desired state in the cluster |
| [Loki](https://repo1.dso.mil/big-bang/product/packages/loki) | 2.9.2 | A Grafana product for aggregating and querying log data |
| [Promtail](https://repo1.dso.mil/big-bang/product/packages/promtail) | 2.9.2 | A logging daemon installed on each cluster node to capture logs from the host and all cluster workload processes. Logs are shipped to Loki |
| [Kiali](https://repo1.dso.mil/big-bang/product/packages/kiali) | 1.74.0 | A status dashboard and debugging utility for the Istio service mesh to assist with monitoring in-cluster networking |
| [Prometheus](https://repo1.dso.mil/big-bang/product/packages/monitoring) | 2.47.2 | A Grafana product for storing and querying time series based data such as system performance metrics (CPU/MEM usage) |
| [Grafana](https://repo1.dso.mil/big-bang/product/packages/monitoring) | 10.1.5 | A Grafana product to provide a frontend interface to display and query performance information from Prometheus, log data from Loki, and request tracing information from Tempo |
| [AlertManager](https://repo1.dso.mil/big-bang/product/packages/monitoring) | 0.26.0 | A tool for configuring alerts based cluster events, log data (Loki), performance indicators (Prometheus) or other custom triggers |
| [Neuvector](https://repo1.dso.mil/big-bang/product/packages/neuvector) | 5.2.2 | A kubernetes security suite that provides CVE scanning for hosts and images, as well as runtime security monitoring and protection |
| [Tempo](https://repo1.dso.mil/big-bang/product/packages/tempo) | 2.3.0 | A Grafana product for collecting, storing and querying request tracing information; used to help understand how a user's request to an application traversed across the system |
| [Velero](https://repo1.dso.mil/big-bang/product/packages/velero) | 1.12.1 | A tool for orchistrating backups of cluster state and storage |
