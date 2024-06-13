# Changelog

All notable changes to this project will be documented in this file.

## [0.2.14](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.13...v0.2.14) (2024-06-13)

### Updated packages
| Package | Old | New |
| ---- | ---- | ---- |
| uds-cli | 0.10.4 | 0.11.0 |
| uds-core | 0.22.0 | 0.22.1 |
| nutanix-init | 0.33.0 | 0.34.0 |
| gitlab-runner | 16.11.0 | 17.0.0 |
| nexus | 3.66.0 | 3.68.1 |
| istio | 1.21.2 | 1.22.1 |
| prometheus | 2.51.2 | 2.52.0 |
| pepr | 0.31.0 | 0.31.1 |
| keycloak | 24.0.4 | 24.0.5 |

### Features

* gitlab-runner update to match gitlab major version [#124](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/pull/124)
* nexus updates to configure sso ([#121](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/121)) ([2f24efe](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/2f24efe207a84a9441a424cb0ea80d7902f41ed0))
* update uds-core ([#128](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/128)) ([949df27](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/949df27a512e4759d8b613fa46518d219438296b))


### Bug Fixes

* add nexus default realm role to bundle config ([#126](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/126)) ([0f31e12](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0f31e1246197a388617023c1640048ec025be7a8))


### Miscellaneous

* update nexus ([0f31e12](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/0f31e1246197a388617023c1640048ec025be7a8))

---
### DETAILS

#### Nexus
#### [3.68.0-uds.1](https://github.com/defenseunicorns/uds-package-nexus/compare/v3.68.0-uds.0...v3.68.0-uds.1) (2024-06-10)

##### Features
* add additional expose template ([a03ba4c](https://github.com/defenseunicorns/uds-package-nexus/commit/a03ba4caf7ce9450b2693efca0dde38c3cb57e99))
* additional ca cert chain var ([#14](https://github.com/defenseunicorns/uds-package-nexus/issues/14)) ([a03ba4c](https://github.com/defenseunicorns/uds-package-nexus/commit/a03ba4caf7ce9450b2693efca0dde38c3cb57e99))

---
#### Gitlab-runner
#### [17.0.0-uds.0](https://github.com/defenseunicorns/uds-package-gitlab-runner/compare/v16.11.0-uds.0...v17.0.0-uds.0) (2024-05-29)

##### ⚠ BREAKING CHANGES
* add netpols and monitoring ([#81](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/81))

##### Features
* add netpols and monitoring ([#81](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/81)) ([71c40fb](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/71c40fb034c78bdfb1247f749f9b620a2b013408))


##### Miscellaneous
* **deps:** update gitlab runner package dependencies ([#80](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/80)) ([8393282](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/83932820933c7c17d405984cf0f4656712e01f6f))
* **deps:** update gitlab runner support dependencies ([#78](https://github.com/defenseunicorns/uds-package-gitlab-runner/issues/78)) ([a203bac](https://github.com/defenseunicorns/uds-package-gitlab-runner/commit/a203baca75cb7ec99b9a4bd0d210044802aa3790))

---
#### uds-core
#### [0.22.1](https://github.com/defenseunicorns/uds-core/compare/v0.22.0...v0.22.1) (2024-06-06)

##### Bug Fixes
* add saml configuration to k3d standard bundle ([#425](https://github.com/defenseunicorns/uds-core/issues/425)) ([15b41d7](https://github.com/defenseunicorns/uds-core/commit/15b41d7ca506dd913316c41321aa9a3133755ab4))
* de-duplicate renovate matches ([#435](https://github.com/defenseunicorns/uds-core/issues/435)) ([4f9dbbb](https://github.com/defenseunicorns/uds-core/commit/4f9dbbbff0bbe1fe348ae7e6c55f97a505f730a9))
* default keycloak realm envs ([#455](https://github.com/defenseunicorns/uds-core/issues/455)) ([3a2b48f](https://github.com/defenseunicorns/uds-core/commit/3a2b48fefb11afcf20f6826fbdef8c43daaf4639))
* exemption race conditions ([#407](https://github.com/defenseunicorns/uds-core/issues/407)) ([d1b3b56](https://github.com/defenseunicorns/uds-core/commit/d1b3b5669976eb23ca8f88cd5b15a12c56102eca))
* integrated docs ([#431](https://github.com/defenseunicorns/uds-core/issues/431)) ([72238fa](https://github.com/defenseunicorns/uds-core/commit/72238faed167a4e90e4d332e17909510efd98a58))
* keycloak schema for package cr ([#436](https://github.com/defenseunicorns/uds-core/issues/436)) ([e32ce9a](https://github.com/defenseunicorns/uds-core/commit/e32ce9af9176ba8fef702a8c6aac84c15f9ab374))
* networkpolicy for keycloak smtp egress ([4059954](https://github.com/defenseunicorns/uds-core/commit/4059954ed92502f10c1b5b769988a363adc06318))
* nightly testing eks config architecture ([#452](https://github.com/defenseunicorns/uds-core/issues/452)) ([a0bbd1f](https://github.com/defenseunicorns/uds-core/commit/a0bbd1f0bf84f03d59866f9797555a08dc8034d6))
* remove deprecated registry login and add env setup ([#443](https://github.com/defenseunicorns/uds-core/issues/443)) ([ca6b76f](https://github.com/defenseunicorns/uds-core/commit/ca6b76f3a66efb6b2e81832aff771ca06bdff68a))
* remove go mod ([#441](https://github.com/defenseunicorns/uds-core/issues/441)) ([0de9693](https://github.com/defenseunicorns/uds-core/commit/0de969333923afb8fd4639547901c7d7f5c6a6f7))
* remove no-tea and update uds version ([#446](https://github.com/defenseunicorns/uds-core/issues/446)) ([434844b](https://github.com/defenseunicorns/uds-core/commit/434844b827e01808b504abf5ee6af83fba813cb6))
* use updated k3s ([#426](https://github.com/defenseunicorns/uds-core/issues/426)) ([1da1c49](https://github.com/defenseunicorns/uds-core/commit/1da1c49e314c73e6fd1f2ef2940aff983262ec6b))


##### Miscellaneous
* add checks before killing pods when updating istio annotations ([#457](https://github.com/defenseunicorns/uds-core/issues/457)) ([a62f9a0](https://github.com/defenseunicorns/uds-core/commit/a62f9a0e04bb538a8018a3f866c88e8b93c59826))
* add debug logs to save logs for easier searching ([#430](https://github.com/defenseunicorns/uds-core/issues/430)) ([319101b](https://github.com/defenseunicorns/uds-core/commit/319101b61e4793037aab6c96b92c9d834763e9b8))
* add velero csi plugin ([#424](https://github.com/defenseunicorns/uds-core/issues/424)) ([c7e49e9](https://github.com/defenseunicorns/uds-core/commit/c7e49e91d9f7810ddc0368f146d43d3c94c782ad))
* **deps:** update githubactions ([#413](https://github.com/defenseunicorns/uds-core/issues/413)) ([ebd834e](https://github.com/defenseunicorns/uds-core/commit/ebd834e56ae9adabe14d9772e4a4d9c305da173c))
* **deps:** update istio to v1.22.1 ([#405](https://github.com/defenseunicorns/uds-core/issues/405)) ([ad4b861](https://github.com/defenseunicorns/uds-core/commit/ad4b861158eecfac1d09a37ea3776e31a1c387cb))
* **deps:** update jest to v29.1.4 ([#438](https://github.com/defenseunicorns/uds-core/issues/438)) ([c3ecc8b](https://github.com/defenseunicorns/uds-core/commit/c3ecc8b83b8c65f09600ab937a1c140c4a5f7db1))
* **deps:** update keycloak to v0.4.4 ([#460](https://github.com/defenseunicorns/uds-core/issues/460)) ([936f40b](https://github.com/defenseunicorns/uds-core/commit/936f40bf078bb06d94ebd51585b4eb7669d426b4))
* **deps:** update keycloak to v0.4.5 ([#461](https://github.com/defenseunicorns/uds-core/issues/461)) ([3592012](https://github.com/defenseunicorns/uds-core/commit/35920121bcdfbdf9b708eb3308ea34763a31246a))
* **deps:** update keycloak to v24.0.5 ([#453](https://github.com/defenseunicorns/uds-core/issues/453)) ([6b0c6fc](https://github.com/defenseunicorns/uds-core/commit/6b0c6fc91f238e367c9f2d54f0daaf9d8065794e))
* **deps:** update keycloak to v24.0.5 ([#454](https://github.com/defenseunicorns/uds-core/issues/454)) ([89911f0](https://github.com/defenseunicorns/uds-core/commit/89911f0ca01ac421a254b79e25124525f464cf51))
* **deps:** update pepr ([#419](https://github.com/defenseunicorns/uds-core/issues/419)) ([d8f0309](https://github.com/defenseunicorns/uds-core/commit/d8f0309b4f9661b1c5bc2d5e574697ee9579e387))
* **deps:** update pepr to v0.4.5 ([#447](https://github.com/defenseunicorns/uds-core/issues/447)) ([f1dba17](https://github.com/defenseunicorns/uds-core/commit/f1dba17076a7c6052ed67e07bdb560fda7604b80))
* **deps:** update prometheus-stack ([#422](https://github.com/defenseunicorns/uds-core/issues/422)) ([a96193e](https://github.com/defenseunicorns/uds-core/commit/a96193e257701dfaf6fccc34246ef3f31e639f3e))
* **deps:** update uds-common to v0.4.4 ([#442](https://github.com/defenseunicorns/uds-core/issues/442)) ([bf6debd](https://github.com/defenseunicorns/uds-core/commit/bf6debdd0d50f6cde11288cd70d8bdf1dcdaaaa0))
* **deps:** update uds-k3d to v0.7.0 ([#428](https://github.com/defenseunicorns/uds-core/issues/428)) ([23b59a2](https://github.com/defenseunicorns/uds-core/commit/23b59a260b2c60791614ca4d39a33e65476e19ee))
* **deps:** update velero ([#408](https://github.com/defenseunicorns/uds-core/issues/408)) ([ffbefda](https://github.com/defenseunicorns/uds-core/commit/ffbefda74777466ef74ad1d5cffff1f4895f323d))
* **deps:** update velero ([#440](https://github.com/defenseunicorns/uds-core/issues/440)) ([4b1a3ea](https://github.com/defenseunicorns/uds-core/commit/4b1a3ead81a80b49e5ccfeb2e4130a4aaebb53a4))
* **deps:** update velero to v6.6.0 ([#456](https://github.com/defenseunicorns/uds-core/issues/456)) ([aff37c1](https://github.com/defenseunicorns/uds-core/commit/aff37c194e321f6a6c92f1bc11fd796cf9f0a9ab))
* **deps:** update zarf to v0.34.0 ([#434](https://github.com/defenseunicorns/uds-core/issues/434)) ([9badf9d](https://github.com/defenseunicorns/uds-core/commit/9badf9d4b9b6f904b1b7a478be5355416dc7fbe0))


## [0.2.13](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/compare/v0.2.12...v0.2.13) (2024-05-29)

### Updated packages
| Package | Old | New |
| ---- | ---- | ---- |
| gitlab | 16.11.1 | 17.0.1 |

### Features

* gitlab update with SAML sso ([#117](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/117)) ([e7fea10](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/commit/e7fea102afeb6aac0ceac01dd80bfdf241861082))

### KNOWN ISSUES
* The addition of the SAML client currently requires manual configuration of a handful of ClientScopes -- this will be automated in the future, refer to slack for instructions for now.
* POTENTIAL issue with the migrations job

> [!WARNING]
> It is recommended that you backup the `gitlab-rails-secret` prior to installing this release

---
### DETAILS

#### gitlab
#### [17.0.1-uds.1](https://github.com/defenseunicorns/uds-package-gitlab/compare/v17.0.1-uds.0...v17.0.1-uds.1) (2024-05-24)


##### ⚠ BREAKING CHANGES

* add saml sso support as the default ([#118](https://github.com/defenseunicorns/uds-package-gitlab/issues/118)) ([d1bc561](https://github.com/defenseunicorns/uds-package-gitlab/commit/d1bc561baa43165a8267f4fe219f4aa4c96548ca))

> **NOTE:** The above change should convert existing instances from OIDC to SAML seamlessly, but will _require_ UDS Core v0.22.0 or higher.

##### Miscellaneous

* **deps:** update support-deps to v37.377.2 ([#134](https://github.com/defenseunicorns/uds-package-gitlab/issues/134)) ([028c3b8](https://github.com/defenseunicorns/uds-package-gitlab/commit/028c3b8c53c073e14db8f2028fceba987b95d66d))

#### [17.0.1-uds.0](https://github.com/defenseunicorns/uds-package-gitlab/compare/v16.11.1-uds.1...v17.0.1-uds.0) (2024-05-24)


##### Bug Fixes

* correct `objectStorage` secret Helm value key for toolbox backups ([366c703](https://github.com/defenseunicorns/uds-package-gitlab/commit/366c703a44681a4b4b77f611b77a840c0e3768b5))
* address registry ingress prod issues with gitlab ([#131](https://github.com/defenseunicorns/uds-package-gitlab/issues/131)) ([ddea7ff](https://github.com/defenseunicorns/uds-package-gitlab/commit/ddea7ffa0133fd2c44bd358bad31207d123fa6f4))

##### Miscellaneous

* add basic smoke tests with sso, git commit, and file uploads ([#132](https://github.com/defenseunicorns/uds-package-gitlab/issues/132)) ([2c34cf9](https://github.com/defenseunicorns/uds-package-gitlab/commit/2c34cf96803e6bc921574f7024f361dc4b3a3690)), closes [#130](https://github.com/defenseunicorns/uds-package-gitlab/issues/130)
* cleanup dev secrets to remove postgres refs ([#126](https://github.com/defenseunicorns/uds-package-gitlab/issues/126)) ([430ebba](https://github.com/defenseunicorns/uds-package-gitlab/commit/430ebbae9a7be246f0ade6c8894a32e169a173b6))
* **deps:** update gitlab package dependencies ([#121](https://github.com/defenseunicorns/uds-package-gitlab/issues/121)) ([366c703](https://github.com/defenseunicorns/uds-package-gitlab/commit/366c703a44681a4b4b77f611b77a840c0e3768b5))
* **deps:** update gitlab support dependencies ([#123](https://github.com/defenseunicorns/uds-package-gitlab/issues/123)) ([8ecd5b4](https://github.com/defenseunicorns/uds-package-gitlab/commit/8ecd5b44420d89611f123bd060df4687c90743b1))
* update dev-secrets to use vendored kubectl command ([#129](https://github.com/defenseunicorns/uds-package-gitlab/issues/129)) ([eb7f356](https://github.com/defenseunicorns/uds-package-gitlab/commit/eb7f3569ce79edec1794daf4e2139fea4f07e58f))

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
