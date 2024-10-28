# UDS Bundle Software Factory Nutanix

## Developmnet Cycle

### 1. Setup your scratch directory

1. Create a `scratch/configs` directory tree in the repo with `dev` and `test` directories in it.
2. Go to 1password, and copy the `DEV uds-config.yaml` and `TEST uds-config.yaml` into `uds-config.yaml` files in the above dev/test directories.
3. Go to 1password, and copy the `mtsi-dev.config` and `mtsi-test.config`notes into a `kubeconfig` file in the dev/test directories.

The UDS tasks assume these files will be in these locations. Be sure to update your uds-config files whenever larger changes are merged in and to update the 1password entries whenever you add / change values. Synchronize with the team to avoid R/W errors.

> Note: if you click to `edit` the entry before copying it, you'll preserve the whitespace formatting.

### 2. Improve the Bundle

Make the changes you'd like to make to the bundle. Note that changes to the uds-config files should be reflected in the `config/uds-config.yaml` example file and the larger rationale documented in `docs/` such as has been done for `nexus` and `gitaly`.

### 3. Test the Improvements

If you only changed the uds configuration values, skip to step 2.

1. Rebuild your bundle. You can do this by either running `uds run create-bundle-rke2` or piecing together a custom version of that general command in your terminal. See [maru](https://github.com/defenseunicorns/maru-runner) and [uds-common/tasks](https://github.com/defenseunicorns/uds-common/tree/main/tasks) to understand the local uds tasks.
2. Redeploy your bundle to the environment you're developing against. If you want a whole bundle deploy, just run `uds run deploy...` (use tab complete to finish that out if you've set it up). However, to speed up your cycles dramatically, create your own version of that UDS deploy command, and use the `-p` flag to only deploy the package you updated. In the example below, we redeploy gitlab:

```bash
UDS_CONFIG=scratch/configs/dev/uds-config.yaml KUBECONFIG=scratch/configs/dev/kubeconfig uds deploy build/uds-bundle-software-factory-nutanix-eksd-amd64-0.4.2.tar.zst -p gitlab --confirm  
# the --confirm flag removes the y/n confirmation like a -y flag
```

The test steps will vary depending on your changes. Note that keycloak's admin credentials are in a secret in it's namespace, and you can create users from there for testing (besides the doug user that's auto-generated).

## Creating Releases

This project uses [release-please-action](https://github.com/google-github-actions/release-please-action) for versioning and releasing OCI packages.

### How should I write my commits?

Release Please assumes you are using [Conventional Commit messages](https://www.conventionalcommits.org/).

The most important prefixes you should have in mind are:

- `fix:` which represents bug fixes, and correlates to a [SemVer](https://semver.org/)
  patch.
- `feat:` which represents a new feature, and correlates to a SemVer minor.
- `feat!:`,  or `fix!:`, `refactor!:`, etc., which represent a breaking change
  (indicated by the `!`) and will result in a SemVer major.

When changes are merged to the `main` branch, the Release Please will evaluate all commits since the previous release to calculate what changes are included and will create another PR to increase the version and tag a new release (per the Release Please design [documentation](https://github.com/googleapis/release-please/blob/main/docs/design.md#lifecycle-of-a-release)). This will also automatically generate changelog entries based on these commits.

> TIP: Merging a PR should be done via a branch **"Squash and merge"**; this means that the commit message seen on this PR merge is what Release Please will use to determine a version bump.

When the auto generated Release Please PR is merged the following steps will automatically happen.
1) A new release will be created and tagged
1) A new bundle artifact will be published to the OCI registry.
