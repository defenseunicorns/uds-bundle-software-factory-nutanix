# Changelog

All notable changes to this project will be documented in this file.

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
