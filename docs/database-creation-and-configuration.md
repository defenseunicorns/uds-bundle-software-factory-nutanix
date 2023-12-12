# Databases
You will need databases created and configured for use by these capabilities in the bundle. Below are example `uds-config.yaml` database entries. Your databases need to conform to what you place in these entries at deploy time.

## Keycloak
```yaml
bundle:
  deploy:
    zarf-packages:
      keycloak-database-manifests:
        set:
          KEYCLOAK_DB_EXTERNAL_NAME: "keycloak-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
      uds-idam:
        set:
          KEYCLOAK_DB_USERNAME: "postgres" # Our example uses this user
          KEYCLOAK_DB_PASSWORD: "replace-me-db-passwords" # Replace
          KEYCLOAK_DB_NAME: "keycloakdb" # Our example uses this database name
          KEYCLOAK_DB_ENDPOINT: "keycloak-postgres.keycloak.svc.cluster.local" # Don't change this, this is an internal reference needed by keycloak
```

## Gitlab
```yaml
bundle:
  deploy:
    zarf-packages:
      gitlab-database-manifests:
        set:
          GITLAB_DB_EXTERNAL_NAME: "gitlab-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          GITLAB_DB_PASSWORD: "replace-me-db-passwords" # Replace
      gitlab:
        set:
          GITLAB_DB_NAME: "gitlabdb" # Our example uses this database name
          GITLAB_DB_USERNAME: "postgres" # Our example uses this user
```

## Sonarqube
```yaml
bundle:
  deploy:
    zarf-packages:
      sonarqube-database-manifests:
        set:
          SONARQUBE_DB_EXTERNAL_NAME: "sonarqube-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          SONARQUBE_DB_PASSWORD: "replace-me-db-passwords" # Replace
      sonarqube:
        set:
          SONARQUBE_DB_NAME: "sonarqubedb" # Our example uses this database name
          SONARQUBE_DB_USERNAME: "postgres" # Our example uses this user
```

## Jira
```yaml
bundle:
  deploy:
    zarf-packages:
      jira-database-manifests:
        set:
          JIRA_DB_EXTERNAL_NAME: "jira-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          JIRA_DB_PASSWORD: "replace-me-db-passwords" #Replace
      jira:
        set:
          JIRA_DB_NAME: "jiradb" # Our example uses this database name
          JIRA_DB_USERNAME: "postgres" # Our example uses this user
```

## Confluence
```yaml
bundle:
  deploy:
    zarf-packages:
      confluence-database-manifests:
        set:
          CONFLUENCE_DB_EXTERNAL_NAME: "confluence-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          CONFLUENCE_DB_PASSWORD: "replace-me-db-passwords" # Replace
      confluence:
        set:
          CONFLUENCE_DB_NAME: "confluencedb" # Our example uses this database name
          CONFLUENCE_DB_USERNAME: "postgres" # Our example uses this user
```

## Mattermost
```yaml
bundle:
  deploy:
    zarf-packages:
      mattermost-database-manifests:
        set:
          MATTERMOST_DB_EXTERNAL_NAME: "mattermost-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          MATTERMOST_DB_PASSWORD: "replace-me-db-passwords" # Replace
          MATTERMOST_DB_USERNAME: "postgres" # Our example uses this user
          MATTERMOST_DB_NAME: "mattermostdb" # Our example uses this database name
```

## Nexus
```yaml
bundle:
  deploy:
    zarf-packages:
      nexus-database-manifests:
        set:
          NEXUS_DB_EXTERNAL_NAME: "nexus-pg.mtsi-dev.bigbang.dev" # Replace with domain entry for your database
          NEXUS_DB_PASSWORD: "replace-me-db-passwords" # Replace
      nexus:
        set:
          NEXUS_DB_NAME: "nexusdb" # Our example uses this database name
          NEXUS_DB_USERNAME: "postgres" # Our example uses this user
```
