# uds-bundle-software-factory-nutanix
A UDS Bundle Containing
- custom init package
- metallb
- dubbd-rke2
- keycloak
- gitlab
- gitlab-runner
- sonarqube
- jira
- confluence
- mattermost
- nexus

## Developer Info

[DEVELOPMENT_MAINTENANCE.md](docs/DEVELOPMENT_MAINTENANCE.md)

## Deploying

You can run the following command to deploy the published bundle from oci. You can use the breadcrumbs in the [Makefile](Makefile) to understand how the examples in this project are configured, built and deployed.

This is only an example. You need to set up and use the `uds-config.yaml`, `deploy-dubbd-values.yaml`, and certs that make sense for your deployment.

`uds deploy oci://ghcr.io/defenseunicorns/uds-bundle/uds-bundle-software-factory-nutanix:v0.x.x-amd64 --confirm`

### UDS Config
Below are the example configurations used in this project to configure deploy time zarf variables for packages in the bundle.
- [uds-config.yaml](uds-config/dev-cluster/uds-config.yaml) Example of our nutanix Dev cluster config
- [uds-config.yaml](uds-config/test-cluster/uds-config.yaml) Example of our nutanix Test cluster config

There will be sensitive values you will need to update before deployment.

### Certs
If deploying from this example you will need to insure the contents in the .pem files linked below are correct for your deployment. They contain the public `bigbang.dev` cert and key as placeholders. The [update-certs.sh](scripts/update-certs.sh) will be called in this examples Makefile to update the appropriate kubernetes resources.
- [test-cluster-ingress-cert.pem](scripts/test-cluster-ingress-cert.pem)
- [test-cluster-ingress-key.pem](scripts/test-cluster-ingress-key.pem)
