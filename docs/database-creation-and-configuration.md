# Databases

You will need databases created and configured for use by these capabilities in the bundle. Below are example `uds-config.yaml` database entries. Your databases need to conform to what you place in these entries at deploy time.

## Keycloak

```yaml
variables:
  keycloak-database-manifests:
    KEYCLOAK_DB_EXTERNAL_NAME: "keycloak-pg.some.url" # Replace with domain entry for your database
  uds-idam:
    KEYCLOAK_DB_USERNAME: "postgres" # Our example uses this user
    KEYCLOAK_DB_PASSWORD: "replace-me-db-passwords" # Replace
    KEYCLOAK_DB_NAME: "keycloakdb" # Our example uses this database name
    KEYCLOAK_DB_ENDPOINT: "keycloak-postgres.keycloak.svc.cluster.local" # Don't change this, this is an internal reference needed by keycloak
```

## Gitlab

```yaml
variables:
  gitlab-database-manifests:
    GITLAB_DB_EXTERNAL_NAME: "gitlab-pg.some.url" # Replace with domain entry for your database
    GITLAB_DB_PASSWORD: "replace-me-db-passwords" # Replace
  gitlab:
    GITLAB_DB_NAME: "gitlabdb" # Our example uses this database name
    GITLAB_DB_USERNAME: "postgres" # Our example uses this user
```

## Sonarqube

```yaml
variables:
  sonarqube-database-manifests:
    SONARQUBE_DB_EXTERNAL_NAME: "sonarqube-pg.some.url" # Replace with domain entry for your database
    SONARQUBE_DB_PASSWORD: "replace-me-db-passwords" # Replace
  sonarqube:
    SONARQUBE_DB_NAME: "sonarqubedb" # Our example uses this database name
    SONARQUBE_DB_USERNAME: "postgres" # Our example uses this user
```

## Jira

```yaml
variables:
  jira:
    JIRA_DB_USERNAME: "postgres"
    JIRA_DB_PASSWORD: "replace-me"
    JIRA_DB_NAME: "jiradb"
    JIRA_DB_ENDPOINT: "jira-pg.mtsi-dev.bigbang.dev"
```

## Confluence

```yaml
variables:
  confluence-database-manifests:
    CONFLUENCE_DB_EXTERNAL_NAME: "confluence-pg.some.url" # Replace with domain entry for your database
    CONFLUENCE_DB_PASSWORD: "replace-me-db-passwords" # Replace
  confluence:
    CONFLUENCE_DB_NAME: "confluencedb" # Our example uses this database name
    CONFLUENCE_DB_USERNAME: "postgres" # Our example uses this user
```

## Mattermost

```yaml
variables:
  mattermost-database-manifests:
    MATTERMOST_DB_EXTERNAL_NAME: "mattermost-pg.some.url" # Replace with domain entry for your database
    MATTERMOST_DB_PASSWORD: "replace-me-db-passwords" # Replace
    MATTERMOST_DB_USERNAME: "postgres" # Our example uses this user
    MATTERMOST_DB_NAME: "mattermostdb" # Our example uses this database name
```

## Nexus

```yaml
variables:
  nexus-database-manifests:
    NEXUS_DB_EXTERNAL_NAME: "nexus-pg.some.url" # Replace with domain entry for your database
    NEXUS_DB_PASSWORD: "replace-me-db-passwords" # Replace
  nexus:
    NEXUS_DB_NAME: "nexusdb" # Our example uses this database name
    NEXUS_DB_USERNAME: "postgres" # Our example uses this user
```
