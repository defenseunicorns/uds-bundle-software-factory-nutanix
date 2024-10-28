# SSO Integration

Most applications deployed with UDS are automatically integrated with Keycloak. However, two applications do not support install-time SSO configuration and so must be configured manually. Those are the Atlassian apps, Jira and Confluence. Please reference the Atlassian documentation for guidance in configuring SSO. Their clients are created in Keycloak, the SAML details just need added to the apps.

## Custom Keycloak Plugin
The Keycloak installation provided as part of UDS Core loads themes and plugins from an init-container. You can optionally provide custom JARs at deploytime simply by adding them to the directory where you run `uds deploy`. This will result in a custom Zarf package being built locally (to include your custom JAR).

> ANY CUSTOM JAR YOU ADD AT DEPLOY TIME WILL NOT BE INCLUDED IN THE BUNDLE SBOM
