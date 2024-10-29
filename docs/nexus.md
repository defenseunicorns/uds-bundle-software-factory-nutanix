# Configuration Notes

**Links**:

- The package repo: <https://github.com/defenseunicorns/uds-package-nexus>
- The upstream BigBang helm chart <https://repo1.dso.mil/big-bang/product/packages/nexus>

## Multiple Docker Registries via Sub-Domains

Nexus supports multiple docker registries in the same Nexus instance. In all editions of Nexus, this can be done by giving [each registry it's own port](https://help.sonatype.com/en/ssl-and-repository-connector-configuration.html). If using Nexus Pro, however, registries can each be [given their own sub-domain](https://help.sonatype.com/en/docker-subdomain-connector.html) while using the main port. This bundle has been setup to support the latter configuration.

> **Note:** we make _no_ use of the [multiple registry related values provided in the upstream Big Bang helm chart](https://repo1.dso.mil/big-bang/product/packages/nexus/-/blob/main/chart/values.yaml?ref_type=heads#L240-L243). The chart is setup for mutliple registries by multiple ports. It's features do no good and actually do harm to multiple registries via sub-domains.

Once deployed, the Istio Tenant Gateway will route all HTTP(S) traffic which hits `*.nexus.{your_fqdn}` to Nexus' main port (same port that receives UI traffic). For any subdomain where a registry exists, Nexus will internally route the traffic to the appropriate handler.

### Configuration & Testing

As an operator, you can setup & test multiple docker registries by following these steps. As your preferences differ from the example, see [the official Nexus documentation](https://help.sonatype.com/en/nexus-repository-administration.html) and linked throughout for help.

1. Deploy the bundle. Note the addition in release 0.5.0 of the UDS_CONFIG variable with path `variables.core.TENANT_HOST_LIST`. This variable defaults to the same list shown below (you can double check by looking in the `uds-bundle.yam`). See in-line comments for each value's function.

```yaml
variables:
  core:
    TENANT_HOST_LIST:
      - "*"  # Tells the tenant gateway to permit traffic at *.{your_fqdn}
      - "*.nexus"  # Tells the tenant gateway to additionally expect (and permit) traffic at *.nexus.{your_fqdn}
```

1. Log into the Nexus UI as an admin (logging into Keycloak and provisioning a user is out of scope for this tutorial) and make two changes to the security settings.
    1. Enable `User Tokens`. These are required for Docker clients to authenticate to the Nexus registry. Ordinary usernames and passwords won't work (same as with Artifactory or Harbor except Nexus has a token user too).
    1. Under [Realms](https://help.sonatype.com/en/realms.html), add the `Docker Bearer Token Realm` as explained [in the Nexus Docker Authentication docs](https://help.sonatype.com/en/docker-authentication.html) to enable Docker client interaction.

1. Create a (for the sake of illustration we'll do `hosted`) Docker registry at your choice of a sub-domain. Do not attempt multiple levels of sub-domain routing. The Tenant Gateway is not expecting `*.*.nexus.{your_fqdn}` traffic and [Nexus will only route based on the first sub-domain anyway](https://help.sonatype.com/en/docker-subdomain-connector.html). See example below where the registry name and sub-domain name are `ninjago` after the [kid's TV show](https://www.imdb.com/title/tt1871731/?ref_=fn_al_tt_2):

    ![image](screenshots/create-ninjago.png)

1. Test the registry. See the screenshot below for an out-of-order illustration of the following steps:

    1. Go to your user's account page, select the `User Token` tab on the left, and generate a token (enabled by step 1.2). Save the token user and password.
    1. Perform a `docker login` to your registry using the given token user and password.
    1. Test pushing and then pulling an image.
    1. To verify multiple registries work, repeat from step 3 with another registry name.

    ![image](screenshots/test-ninjago.png)

    > In the screenshot above, we retagged the docker `hello-world` image from the first sub-domain registry we created and tested (`unexpected-name`) to the second one (`ninjago`), tried to push and failed because we were only signed into `unexpected-name`, signed into `ninjago`, and pushed/pulled the image to prove in development that multiple registries were working. See [issue #186](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/186) for bundle developer notes and broader context on the screenshot.

**Links**:

- <https://help.sonatype.com/en/nexus-repository-administration.html>
- <https://help.sonatype.com/en/ssl-and-repository-connector-configuration.html>
- <https://help.sonatype.com/en/docker-authentication.html>
- <https://help.sonatype.com/en/realms.html>
- <https://help.sonatype.com/en/docker-subdomain-connector.html>
