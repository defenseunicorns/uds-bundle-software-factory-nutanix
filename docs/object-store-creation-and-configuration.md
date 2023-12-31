# Object Store
You will need object storage created and configured for use by these capabilities in the bundle. Below are example `uds-config.yaml` object store entries. Your object store needs to conform to what you place in these entries at deploy time. You will also see the buckets that need to exist for these capabilities.

## Velero
You will to create and configure the bucket you are going to use for Velero

### config
```yaml
variables:
  dubbd-rke2:
    VELERO_BUCKET_PROVIDER_URL: "http://swf.objects.mtsi.bigbang.dev" # Replace with domain entry for your object store
    VELERO_BUCKET: "velero-bucket" # Configure the appropriate name of your bucket
    VELERO_BUCKET_REGION: "us-east-1" # Replace with appropriate region. Nutanix expects this to be us-east-1
    VELERO_BUCKET_KEY: "replace-me-object-store-access-key" # Replace with access key to your object store
    VELERO_BUCKET_KEY_SECRET: "replace-me-object-store-secret-key" # Replace with secret key to your object store
```

## Gitlab
You will need these buckets created in your object store. If you choose to configure bucket names to use a suffix, your bucket names will need to contain that suffix.

### buckets
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

### config

```yaml
variables:
  gitlab-object-store:
    ENDPOINT: "http://swf.objects.mtsi.bigbang.dev" # Replace with domain entry for you object store
    ACCESS_KEY: "replace-me-object-store-access-key" # Replace with access key to your object store
    SECRET_KEY: "replace-me-object-store-secret-key" # Replace with secret key to your object store
  gitlab:
    BUCKET_SUFFIX: "" # You can choose to add a suffix to the end of every bucket name if desired or needed.
```

## Mattermost
You will need this bucket created in your object store. If you choose to configure bucket names to use a suffix, your bucket names will need to contain that suffix.

### buckets
- mattermost-bucket

### config

```yaml
variables:
  mattermost-object-store:
    ACCESS_KEY: "replace-me-object-store-access-key" # Replace with access key to your object store
    SECRET_KEY: "replace-me-object-store-secret-key" # Replace with secret key to your object store
    # Replace CA_CERT with your object store cert that you need to trust
    CA_CERT: |
      -----BEGIN CERTIFICATE-----
      replace-me-ca-cert-to-trust
      -----END CERTIFICATE-----
  mattermost:
    MATTERMOST_BUCKET_SUFFIX: "" # You can choose to add a suffix to the end of every bucket name if desired or needed.
    MATTERMOST_FILE_STORE_ENDPOINT: "swf.objects.mtsi.bigbang.dev" # Replace with domain entry for you object store
    # Volume used to mount the CA_CERT you need to trust from your object store
    MATTERMOST_VOLUMES: |
      - name: ca-cert
        secret:
          secretName: ca-secret
          defaultMode: 0644
    # Volume mount used to mount the CA_CERT you need to trust from your object store
    MATTERMOST_VOLUME_MOUNTS: |
      - name: ca-cert
        mountPath: /etc/ssl/certs
        readOnly: true
```
