# Changelog

All notable changes to this project will be documented in this file.

## [0.2.12](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.11...v0.2.12) (2024-05-23)

### Updated packages
| Package | Old | New |
| ---- | ---- | ---- |
| uds-core | 0.21.0 | 0.22.0 |
| velero | 1.13.1 | 1.13.2 |
| pepr | 0.29.2 | 0.31.0 |
| keycloak | 24.0.3 | 24.0.4 |

### Features

* enable csi plugin for backups using nutanix csi and velero ([#112](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/112)) ([8e2326d](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/8e2326db9ae1e4d0a34e2cc52423932ca526cb53))
* uncommenting the gitlab runner ([#115](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/115)) ([7659aa0](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7659aa094b10d6b90c25d5586b6bf49952fce152))
* update to uds-core 0.22.0 ([#116](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/116)) ([86ff035](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/86ff035c800e509c0a30df5b53f2e431c545eea5))

---
### DETAILS

#### uds-core
#### [0.22.0](https://github.com/defenseunicorns/uds-core/compare/v0.21.1...v0.22.0) (2024-05-22)


##### Features

* add `expose` service entry for internal cluster traffic ([#356](https://github.com/defenseunicorns/uds-core/issues/356)) ([1bde4cc](https://github.com/defenseunicorns/uds-core/commit/1bde4ccf302864b0c38d093742ca683b96cebe89))
* add reconciliation retries for CRs ([#423](https://github.com/defenseunicorns/uds-core/issues/423)) ([424b57b](https://github.com/defenseunicorns/uds-core/commit/424b57ba91906e1c60e6e92927e37b34d657ad01))
* uds common renovate config ([#391](https://github.com/defenseunicorns/uds-core/issues/391)) ([035786c](https://github.com/defenseunicorns/uds-core/commit/035786cadcd9c1fbaf7e0a798f9c13104a1a9a14))
* uds core docs ([#414](https://github.com/defenseunicorns/uds-core/issues/414)) ([a35ca7b](https://github.com/defenseunicorns/uds-core/commit/a35ca7b484ab59572d8205a625db5447a8771e44))


##### Bug Fixes

* mismatched exemption/policy for DropAllCapabilities ([#384](https://github.com/defenseunicorns/uds-core/issues/384)) ([d8ec278](https://github.com/defenseunicorns/uds-core/commit/d8ec27827e2e2e7d85b4eba6b738f4b126264dd9))
* pepr mutation annotation overwrite ([#385](https://github.com/defenseunicorns/uds-core/issues/385)) ([6e56b2a](https://github.com/defenseunicorns/uds-core/commit/6e56b2afec8f54f8c0a4aa4b89fef1d1c754b627))
* renovate config grouping, test-infra ([#411](https://github.com/defenseunicorns/uds-core/issues/411)) ([05fd407](https://github.com/defenseunicorns/uds-core/commit/05fd407e9c3bf6a0bac33de64e892ce2a63275ac))
* renovate pepr comment ([#410](https://github.com/defenseunicorns/uds-core/issues/410)) ([a825388](https://github.com/defenseunicorns/uds-core/commit/a82538817765ad21adb5f6bba283951bf4c23272))


##### Miscellaneous

* **deps:** update keycloak ([#390](https://github.com/defenseunicorns/uds-core/issues/390)) ([3e82c4e](https://github.com/defenseunicorns/uds-core/commit/3e82c4ece470a5eea81d937b2b38c455934212e1))
* **deps:** update keycloak to v24.0.4 ([#397](https://github.com/defenseunicorns/uds-core/issues/397)) ([c0420ea](https://github.com/defenseunicorns/uds-core/commit/c0420ea750b3a7dfc8ea6adab5225f76178ef953))
* **deps:** update keycloak to v24.0.4 ([#402](https://github.com/defenseunicorns/uds-core/issues/402)) ([e454576](https://github.com/defenseunicorns/uds-core/commit/e454576a6de53e833d6b925308f09d6007166dde))
* **deps:** update neuvector to v9.4 ([#381](https://github.com/defenseunicorns/uds-core/issues/381)) ([20d4170](https://github.com/defenseunicorns/uds-core/commit/20d4170386d2437826abafc68d87d91dc457022a))
* **deps:** update pepr to 0.31.0 ([#360](https://github.com/defenseunicorns/uds-core/issues/360)) ([fbd61ea](https://github.com/defenseunicorns/uds-core/commit/fbd61ea9665133619aec81726b189449226d8459))
* **deps:** update prometheus-stack ([#348](https://github.com/defenseunicorns/uds-core/issues/348)) ([49cb11a](https://github.com/defenseunicorns/uds-core/commit/49cb11a058a9209cee7019fa552b8c0b2ef73368))
* **deps:** update prometheus-stack ([#392](https://github.com/defenseunicorns/uds-core/issues/392)) ([2e656f5](https://github.com/defenseunicorns/uds-core/commit/2e656f5dc3de2e6561ac313cb1bae478635b86b3))
* **deps:** update uds to v0.10.4 ([#228](https://github.com/defenseunicorns/uds-core/issues/228)) ([1750b23](https://github.com/defenseunicorns/uds-core/commit/1750b2304e3c6f0ce6a60f1ef2873ce8a6ce1502))
* **deps:** update uds-k3d to v0.6.0 ([#398](https://github.com/defenseunicorns/uds-core/issues/398)) ([288f009](https://github.com/defenseunicorns/uds-core/commit/288f00990a715087c9bf1fffd0a63ecf33125a5a))
* **deps:** update velero ([#350](https://github.com/defenseunicorns/uds-core/issues/350)) ([e7cb33e](https://github.com/defenseunicorns/uds-core/commit/e7cb33ea9a13ab9550aab45d8ee437a1ba595d38))
* **deps:** update zarf to v0.33.2 ([#394](https://github.com/defenseunicorns/uds-core/issues/394)) ([201a37b](https://github.com/defenseunicorns/uds-core/commit/201a37b12277880058c14fc05b3c0d4aecbf31e0))


## [0.2.11](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.10...v0.2.11) (2024-05-17)


### Bug Fixes

* Revert CSI image versions to Nutanix CSI chart defaults ([#110](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/110)) ([e6ea62e](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/e6ea62efe736abc5395b2f7ad3de59005a4a3b17))

## [0.2.10](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.9...v0.2.10) (2024-05-16)

### ⚠ BREAKING CHANGES

* commented out everything not needed for the MVP ([#106](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/106))

### Bug Fixes

* commented out everything not needed for the MVP ([#106](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/106)) ([2dd26e6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/2dd26e658a15ed722f8343c777563eff85a67823))

---
### DETAILS
This release cuts the uds bundle down to the desired MVP applications

Contains:
- nutanix csi init package
- metallb
- uds-core
- gitlab
- nexus

## [0.2.9](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.8...v0.2.9) (2024-05-15)

### Updated packages
| Package | Old | New |
| ---- | ---- | ---- |
| rook-ceph init | v0.33.0-0.2.7 | REMOVED |
| nutanix CSI init | N/A | v2.6.8 |
| uds-core | 0.21.0 | 0.21.1 |
| gitlab | v16.10.2 | v16.11.1 |
| gitlab-runner | v16.8.0 | v16.11.0 |
| jira | 9.12.4 | 9.15.1 |

### Features

* Custom init package for Nutanix CSI driver ([#42](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/42)) ([7fdd48f](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7fdd48f388209e2561f23866f40854ac695e7df5))
* nutanix csi ha zarf init ([#100](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/100)) ([4c1197b](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/4c1197b73d316a7af625e547fd58fd74841254be))
* Replace ceph with nutanix-csi for persistent storage ([7fdd48f](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7fdd48f388209e2561f23866f40854ac695e7df5))


### Bug Fixes

* gitlab ssh netpol ([#92](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/92)) ([952659b](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/952659bfbd6ebc9dd424d3f1f8c4a4ad0c1aac36))


### Miscellaneous

* **deps:** update all dependencies ([#85](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/85)) ([99b3776](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/99b3776ebdf0e766aa29de1984ce75b7866e67db))

---
### DETAILS

#### uds-core
#### [0.21.1](https://github.com/defenseunicorns/uds-core/compare/v0.21.0...v0.21.1) (2024-05-02)


##### Bug Fixes

* slim-dev monitoring handling ([#383](https://github.com/defenseunicorns/uds-core/issues/383)) ([79927aa](https://github.com/defenseunicorns/uds-core/commit/79927aa58cbb12c849e52b50c00b74629b100b31))


##### Miscellaneous

* updating keycloak chart version to align with image ([#378](https://github.com/defenseunicorns/uds-core/issues/378)) ([a60fe2a](https://github.com/defenseunicorns/uds-core/commit/a60fe2afed9f7cff3bcad6b0f563232b47e8025b))

---

#### gitlab
#### [16.11.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.10.2-uds.0...v16.11.1-uds.0) (2024-05-02)


#### ⚠ BREAKING CHANGES

* sso failing deployment when it is disabled ([#115](https://github.com/defenseunicorns/uds-package-gitlab/issues/115))
* allow [templating of network policies](./docs/networking.md) in the UDS Package ([#110](https://github.com/defenseunicorns/uds-package-gitlab/issues/110))

##### Features

* allow [templating of network policies](./docs/networking.md) in the UDS Package ([#110](https://github.com/defenseunicorns/uds-package-gitlab/issues/110)) ([5af09cb](https://github.com/defenseunicorns/uds-package-gitlab/commit/5af09cb47b30a258633bdb4c4d2268df3c9e456d))


##### Bug Fixes

* sso failing deployment when it is disabled ([#115](https://github.com/defenseunicorns/uds-package-gitlab/issues/115)) ([8cfdb58](https://github.com/defenseunicorns/uds-package-gitlab/commit/8cfdb58a05f9fe4d652b1ca2060d339660d809e4))


##### Miscellaneous

* allow GL pages through istio ([#106](https://github.com/defenseunicorns/uds-package-gitlab/issues/106)) ([9613f76](https://github.com/defenseunicorns/uds-package-gitlab/commit/9613f765ee346a370f1baaa10e0d35779532ca77))
* **deps:** update gitlab package dependencies ([#112](https://github.com/defenseunicorns/uds-package-gitlab/issues/112)) ([a0e2c48](https://github.com/defenseunicorns/uds-package-gitlab/commit/a0e2c48f2f974683e055d1641fb510aa218c8c8e))
* **deps:** update gitlab support dependencies ([#113](https://github.com/defenseunicorns/uds-package-gitlab/issues/113)) ([cde79b3](https://github.com/defenseunicorns/uds-package-gitlab/commit/cde79b313a83c1c24036d6456771eafb60f97ecb))
* **deps:** update gitlab support dependencies ([#99](https://github.com/defenseunicorns/uds-package-gitlab/issues/99)) ([275ccd6](https://github.com/defenseunicorns/uds-package-gitlab/commit/275ccd6e86c3f1ea2d5b8d4f2780e497cedb375e))
* migrate to upstream chart ([#72](https://github.com/defenseunicorns/uds-package-gitlab/issues/72)) ([b0e151e](https://github.com/defenseunicorns/uds-package-gitlab/commit/b0e151e76104cd3130e41cd185d433fd628dcfa0))
* release v16.11.1-uds.0 ([#120](https://github.com/defenseunicorns/uds-package-gitlab/issues/120)) ([5c13d62](https://github.com/defenseunicorns/uds-package-gitlab/commit/5c13d6209aeb9fc8f7ce1da0d3c4ac4f22ae274e))
* switch to new SSO secret template ([#111](https://github.com/defenseunicorns/uds-package-gitlab/issues/111)) ([acf28bc](https://github.com/defenseunicorns/uds-package-gitlab/commit/acf28bc7eccf2cf547a0191fc61d37105486608d))

* updating keycloak chart version to align with image ([#378](https://github.com/defenseunicorns/uds-core/issues/378)) ([a60fe2a](https://github.com/defenseunicorns/uds-core/commit/a60fe2afed9f7cff3bcad6b0f563232b47e8025b))

---

#### gitlab-runner
#### [16.11.0-uds.0](https://github.com/defenseunicorns/uds-package-gitlab-runner/compare/v16.10.0-uds.0...v16.11.0-uds.0) (2024-05-07)


##### Miscellaneous

* **deps:** update gitlab runner package dependencies ([#77](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/77)) ([a74125e](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/a74125ebd5469f5b0015d148e86c76dda19a0a7c))
* **deps:** update gitlab runner support dependencies ([#71](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/71)) ([19eabac](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/19eabac881b710ba0fc0d7baa03aaf8b9d71db75))
* **deps:** update gitlab runner support dependencies ([#75](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/75)) ([f8c97fb](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/f8c97fbf41a61b355f64d4583da1a809af6ceb0a))
* hotfix the update to spoof the release ([#69](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/69)) ([5056b18](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/5056b189f7f6491e15b19cce079cbce3ff5fbf17))
* improve jest test patterns ([#73](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/73)) ([6c60a90](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/6c60a90feaefc7873b2bd87ace27e1beb198845d))

---

#### jira
#### [1.19.0-uds.0](https://github.com/defenseunicorns/uds-package-jira/compare/v1.17.2-uds.1...v1.19.0-uds.0) (2024-05-08)


##### Features

* update jira and chart, and cleanup repo ([711d62d](https://github.com/defenseunicorns/uds-package-jira/commit/711d62d57bd768d2cc9cdf99ffc1ed8ba1ffd7c3))


##### Miscellaneous

* release 1.19.0-uds.0 ([2faec99](https://github.com/defenseunicorns/uds-package-jira/commit/2faec99bb3eadbb88436842c0f0e8d6c921fcb1b))

## [0.2.8](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.7...v0.2.8) (2024-05-06)


### Bug Fixes

* Adding identity config image to zarf pkg -- updating to match core ([c9bc813](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/c9bc81363c60a0bd33ab688ae13fccf04f52bdd4))


## [0.2.7](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.6...v0.2.7) (2024-05-01)

### Updated packages
| Package | Old | New |
| ---- | ---- | ---- |
| uds-core | 0.20.0 | 0.21.0 |
| istio | 1.20.3 | 1.21.2 |
| mattermost | 9.7.1 | 9.7.2 |


### Features

* uds-core 0.21.0 ([#90](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/90)) ([cc69a2c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/cc69a2c280943e259af9e1c5193a0db4a9988d5c))


### Bug Fixes

* fix pre uds-core package exemptions ([#88](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/88)) ([45b1845](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/45b18450daa089441f5865d2758b6704b134d941))

---
DETAILS
### uds-core
### [0.21.0](https://github.com/defenseunicorns/uds-core/compare/v0.20.0...v0.21.0) (2024-04-30)

#### Features
* add `monitor` to operator, fix monitoring setup ([#256](https://github.com/defenseunicorns/uds-core/issues/256)) ([bf67722](https://github.com/defenseunicorns/uds-core/commit/bf67722d4e7e02d44dd29c4436e9a8d2ef960fa5))

#### Bug Fixes

* loki s3 overrides ([#365](https://github.com/defenseunicorns/uds-core/issues/365)) ([3545066](https://github.com/defenseunicorns/uds-core/commit/354506647d65b0484332695abbbd58d91d9e7427))
* update neuvector values for least privilege ([#373](https://github.com/defenseunicorns/uds-core/issues/373)) ([7f4de4f](https://github.com/defenseunicorns/uds-core/commit/7f4de4f729e60a258abc40ce34f9c397fae99181))


### mattermost
### [9.7.2-uds.0](https://github.com/defenseunicorns/uds-package-mattermost/compare/v9.7.1-uds.0...v9.7.2-uds.0) (2024-04-30)

#### Miscellaneous

* **deps:** update mattermost package dependencies ([#59](https://github.com/defenseunicorns/uds-package-mattermost/issues/59)) ([edf154b](https://github.com/defenseunicorns/uds-package-mattermost/commit/edf154b7c947a7cb4b107f10252a92a9c21c57c5))
* **deps:** update mattermost support dependencies ([#55](https://github.com/defenseunicorns/uds-package-mattermost/issues/55)) ([fe798f6](https://github.com/defenseunicorns/uds-package-mattermost/commit/fe798f6111cd5dfb25ee78a0a58188754a4d4b1d))
* release as v9.7.2-uds.0 ([#62](https://github.com/defenseunicorns/uds-package-mattermost/issues/62)) ([bc0b65f](https://github.com/defenseunicorns/uds-package-mattermost/commit/bc0b65fbe4b8289857d4f89a7106d1fbb7c89cf2))

## [0.2.6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.5...v0.2.6) (2024-04-24)

### Release Notes
- Added custom keycloak plugin support. Below note is in the README.md of this repo.
```
Custom Keycloak Plugin
The Keycloak installation provided as part of UDS Core loads themes and plugins from an init-container.
You can optionally provide custom JARs at deploytime simply by adding them to the directory where you
run uds deploy. This will result in a custom Zarf package being built locally (to include your custom JAR).

ANY CUSTOM JAR YOU ADD AT DEPLOY TIME WILL NOT BE INCLUDED IN THE BUNDLE SBOM
```
- Package version updates to uds-core and mattermost
- Updated [packages and dependencies doc](docs/packages-and-dependencies.md)

### Features

* plugin data injector ([#82](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/82)) ([15ca8aa](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/15ca8aa0fb1f12ae99ad2c811209ecf32579e589))


### Miscellaneous

* upgrade mattermost to 9.7.1-uds.0-registry1 ([15ca8aa](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/15ca8aa0fb1f12ae99ad2c811209ecf32579e589))
* upgrade uds-core to 0.20.0-registry1 ([15ca8aa](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/15ca8aa0fb1f12ae99ad2c811209ecf32579e589))

## [0.2.5](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.4...v0.2.5) (2024-04-18)

### Release Notes
- Download and use uds v0.10.4 with this release
- Contains Gitlab security updates
- Contains Gitlab Web IDE is fixed
- View [updated dependency doc](docs/packages-and-dependencies.md) for all package version updates in this release
- Mattermost should be in a better state. Some plugins may still need more work
- You can now add a CA cert chain to trust and mattermost will consume that config and mount it to its ssl certs
- You can update your `uds-config.yaml` to contain the new variables shown below. `VOLUME_MOUNTS` and `VOLUMES` must be those values as the bundle will create the secret containing what you provide in the `ADDITIONAL_CA_CHAIN`. You can leave these variables out if you don't need them.
```yaml
shared:
  # ADDITIONAL_CA_CHAIN value must be base64 encoded
  ADDITIONAL_CA_CHAIN: replace-me-with-additional-ca-chain
variables:
  mattermost:
    VOLUME_MOUNTS:
      - name: ca-cert
        mountPath: /etc/ssl/certs
        readOnly: true
    VOLUMES:
      - name: ca-cert
        secret:
          secretName: ca-secret
          defaultMode: 0644
```

### Features

* add ability to add additional cert chain for mattermost ([1eb5528](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/1eb5528b815135b16497aaad90c99625ecea76e4))


### Bug Fixes

* mattermost object storage configuration ([#81](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/81)) ([1eb5528](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/1eb5528b815135b16497aaad90c99625ecea76e4))


### Miscellaneous

* add renovate config ([0beebda](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0beebda63c0c4a16dcf4ea9f1da2a77ce931a308))
* cleanup namespaces package ([cff40a9](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/cff40a90a16b9cdf8938ce8d0f0108c5e3e9328e))
* update gitlab to 16.10.2-uds.0 ([0beebda](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0beebda63c0c4a16dcf4ea9f1da2a77ce931a308))
* update init package to v0.33.0-0.2.7 ([#83](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/83)) ([0beebda](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0beebda63c0c4a16dcf4ea9f1da2a77ce931a308))
* update uds-cli to 0.10.4 ([0beebda](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0beebda63c0c4a16dcf4ea9f1da2a77ce931a308))
* update uds-core to v0.19.0 ([0beebda](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0beebda63c0c4a16dcf4ea9f1da2a77ce931a308))

## [0.2.4](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.3...v0.2.4) (2024-04-05)

### Release Notes
There are some configuration values to add and update in your `uds-config.yaml` file
```yaml
variables:
  core:
    # Creates a default admin account. Change the password on first login!
    KEYCLOAK_INSECURE_ADMIN_PASSWORD_GENERATION: true
    # New Loki configs for loki simple scalable deployment
    LOKI_CHUNKS_BUCKET: "loki-chunks-bucket"
    LOKI_RULER_BUCKET: "loki-ruler-bucket"
    LOKI_ADMIN_BUCKET: "loki-admin-bucket"
    LOKI_S3_ENDPOINT: "http://replace.with.object.store.url"
    LOKI_S3_REGION: "us-east-1"
    LOKI_S3_ACCESS_KEY_ID: "replace-me-object-store-access-key"
    LOKI_S3_SECRET_ACCESS_KEY: "replace-me-object-store-secret-key"
    # New Velero configs
    VELERO_BUCKET_PROVIDER_URL: "http://replace.with.object.store.url"
    VELERO_BUCKET: "velero-bucket"
    VELERO_BUCKET_REGION: "us-east-1"
    VELERO_BUCKET_KEY: "replace-me-object-store-access-key"
    VELERO_BUCKET_KEY_SECRET: "replace-me-object-store-secret-key"
  nexus:
    # Updated the name of this variable
    NEXUS_DB_PASSWORD: "replace-me-db-passwords"
```

There are new object storage buckets needed for loki.
```
loki-chunks-bucket
loki-ruler-bucket
loki-admin-bucket
```

### Features

* Configure velero ([0e1db1f](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0e1db1fad4e5a19a97f3f2bf5f21bd1652b9ec23))


### Bug Fixes

* confluence variable override names ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* gitlab redis secret fix ([#44](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/44)) ([16e23b7](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/16e23b7907ac1452a5c0dac0107e7f509f78fe64))
* gitlab workhorse resource config ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* jira variable override names ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))


### Miscellaneous

* add new keycloak admin and loki scalable configs ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* remove core dns package ([16e23b7](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/16e23b7907ac1452a5c0dac0107e7f509f78fe64))
* update confluence to 1.18.0-uds.0 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update gitlab to 16.10.1-uds.1 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update gitlab-runner to 16.10.0-uds.0 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update jira to 1.17.2-uds.0 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update mattermost to 9.6.1-uds.0 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update nexus to 3.66.0-uds.1-registry1 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update sonarqube to 8.0.3-uds.6 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update uds tasks to use ./uds ([16e23b7](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/16e23b7907ac1452a5c0dac0107e7f509f78fe64))
* update uds-cli to v0.10.3 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update uds-core to 0.18.0 ([#77](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/77)) ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))
* update zarf init/rook to v0.32.6-0.2.5 ([6196853](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/6196853cd6f281dc692a1a612489faba7c45295e))

## [0.2.3](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.2...v0.2.3) (2024-03-14)


### Features

* Add rook ceph config and exemptions ([#39](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/39)) ([ef9adc6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/ef9adc665504d76ec647377c4b631fb7b6ffcfff))

## [0.2.2](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.1...v0.2.2) (2024-03-09)


### Miscellaneous

* add envoy filter to additional manifests ([8e9aeb6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/8e9aeb6f72d21800ad5fe354b3c566bd821e16a7))
* update uds core to 0.15.0 ([#37](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/37)) ([8605356](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/860535651cef05e32d09af6571933474b87d8952))
* update zarf and uds ([#33](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/33)) ([8e9aeb6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/8e9aeb6f72d21800ad5fe354b3c566bd821e16a7))
* upgrade uds-core, gitlab, and confluence ([8e9aeb6](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/8e9aeb6f72d21800ad5fe354b3c566bd821e16a7))

## [0.2.1](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.0...v0.2.1) (2024-03-07)


### Features

* add configurable overrides for GitLab resource limits ([#34](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/34)) ([790194e](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/790194effdcc6493c87fc0bceb8733c1b95b9850))
* exposes ssh port for gitlab ([#30](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/30)) ([af3dd7b](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/af3dd7b34953a187cc72973d83f4b61053a87070))


### Bug Fixes

* confluence and jira volume overrides ([#31](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/31)) ([bb50ca4](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bb50ca46aa85825b9762d4e5f24f410c5657033d))

## [0.2.0](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.5...v0.2.0) (2024-02-26)


### ⚠ BREAKING CHANGES

* full transition to uds-core ([#28](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/28))

### Features

* full transition to uds-core ([#28](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/28)) ([2ebb047](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/2ebb047f79acf8bd49f01f9e86f0c69db19b954a))


### Miscellaneous

* release 0.2.0 ([9c7ccf9](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/9c7ccf9b31d4a954e93f57d45c1af41b6e7be1c3))

## [0.1.5](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.4...v0.1.5) (2024-02-20)


### Miscellaneous

* Update dubbd to 0.16.0 ([#24](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/24)) ([a46f7ad](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/a46f7ad18a04246372cf9e92e86d475f445b0ff3))
* Update Gitlab, sonarqube, jira and confluence ([a46f7ad](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/a46f7ad18a04246372cf9e92e86d475f445b0ff3))
* Upgrade capabilities and tools ([8ed79a1](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/8ed79a1a0760809dabeb46f654a69bbd71204866))

## [0.1.4](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.3...v0.1.4) (2023-12-19)


### Features

* Build DUBBD skeleton ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Configure Gitlab scheduled backups ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Configure Velero ([5461e5f](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/5461e5f43b0638a40608c79d916b7f94cb4c7789))
* Expose SSH in gitlab ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Require certs in uds-confg.yaml ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))


### Bug Fixes

* remove rogue quote in uds-config files ([5d7ebe1](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/5d7ebe193bc398ae8f367745a8574183625ca446))


### Miscellaneous

* Upgrade DUBBD to 0.15.0 ([5461e5f](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/5461e5f43b0638a40608c79d916b7f94cb4c7789))
* Upgrade multiple bundle packages ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Upgrade nexus and mattermost to expose sso config ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Upgrade UDS to v0.5.1 ([#21](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/21)) ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))
* Upgrade zarf to v0.31.4 ([bf8a44c](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/bf8a44c914e4aaa971d0595e47c394179860407c))

## [0.1.3](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.2...v0.1.3) (2023-12-12)


### Features

* Integrate gitlab with external object store ([7308c45](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7308c452958c6624c1436feabb025e459269a639))
* Integrate gitlab with external object store ([#15](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/15)) ([7308c45](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7308c452958c6624c1436feabb025e459269a639))


### Miscellaneous

* Upgrade to uds-cli v0.4.1 ([7308c45](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/7308c452958c6624c1436feabb025e459269a639))

## [0.1.2](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.1...v0.1.2) (2023-12-06)


### Miscellaneous

* Upgrade UDS-CLI to v0.4.0 ([#13](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/13)) ([3a499ae](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/3a499ae01cc2631c8ae1c21aba34f29da2839ca3))

## [0.1.1](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.1.0...v0.1.1) (2023-12-01)


### Features

* Initial release updates ([eb351da](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/eb351dabef029a6ee677a510f6977d154c4c3a55))


### Miscellaneous

* Add DEVELOPMENT_MAINTENANCE.md doc ([3b70ce9](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/3b70ce9ad4f8e3766e8e056fed52ad672b2e95db))

## [0.0.1] - 2023-11-30
PRE RELEASE
