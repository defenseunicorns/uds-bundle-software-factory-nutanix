# Changelog

All notable changes to this project will be documented in this file.

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
