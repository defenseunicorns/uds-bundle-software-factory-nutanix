# Object Store

You will need object storage created and configured for use by these capabilities in the bundle. Below are example `uds-config.yaml` object store entries. Your object store needs to conform to what you place in these entries at deploy time. You will also see the buckets that need to exist for these capabilities.

## Velero

You will to create and configure the bucket you are going to use for Velero

### config

```yaml
variables:
  core:
    VELERO_BUCKET_PROVIDER_URL: "http://replace.with.object.store.url"
    VELERO_BUCKET: "velero-bucket"
    VELERO_BUCKET_REGION: "us-east-1"
    VELERO_BUCKET_KEY: "replace-me-object-store-access-key"
    VELERO_BUCKET_KEY_SECRET: "replace-me-object-store-secret-key"
```

## Gitlab

You will need these buckets created in your object store. If you choose to configure bucket names to use a suffix, your bucket names will need to contain that suffix.

### Gitlab buckets

- uds-gitlab-artifacts
- uds-gitlab-backups
- uds-gitlab-ci-secure-files
- uds-gitlab-dependency-proxy
- uds-gitlab-lfs
- uds-gitlab-mr-diffs
- uds-gitlab-packages
- uds-gitlab-pages
- uds-gitlab-terraform-state
- uds-gitlab-uploads
- uds-gitlab-registry
- uds-gitlab-tmp

### Gitlab config

```yaml
variables:
  gitlab-object-store:
    ENDPOINT: "http://replace.with.object.store.url"
    ACCESS_KEY: "replace-me-object-store-access-key"
    SECRET_KEY: "replace-me-object-store-secret-key"
  gitlab:
    BUCKET_SUFFIX: "" # You can choose to add a suffix to the end of every bucket name if desired or needed.
```

## Mattermost

You will need this bucket created in your object store. If you choose to configure bucket names to use a suffix, your bucket names will need to contain that suffix.

### Mattermost buckets

- mattermost-bucket

### Mattermost config

```yaml
variables:
  mattermost:
    ACCESS_KEY: "replace-me-object-store-access-key"
    SECRET_KEY: "replace-me-object-store-secret-key"
    OBJECT_STORE_SECURE: "false"
    OBJECT_STORE_ENDPOINT: "replace.with.object.store.url"
    OBJECT_STORE_BUCKET: "mattermost-bucket"
```
