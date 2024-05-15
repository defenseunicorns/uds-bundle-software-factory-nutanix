# Verify Deployment

To ensure that your deployment is healthy and functioning correctly, follow these steps:

- **Check Application Availability**: Verify that all the applications in your deployment are up and running:
    ```bash
    # Retrieve all application urls to verify
    uds zarf tools kubectl get virtualservices -A -o json | jq -r '.items[].spec.hosts[]' | grep -v "^sso" | sort | uniq
    ```
    Example list with default domain.
    ```
    chat.uds.dev
    confluence.uds.dev
    gitlab.uds.dev
    grafana.admin.uds.dev
    jira.uds.dev
    keycloak.admin.uds.dev
    neuvector.admin.uds.dev
    nexus.uds.dev
    registry.uds.dev
    sonarqube.uds.dev
    ```
    Ensure you can get to these applications and their UIs load appropriately.

- **Test Logins**: Verify you can login to these applications via the default admin accounts or by using sso if configured. You may need to login to keycloak as an admin, create a user, and assign it to the appropriate groups to be able to login to the other applications using sso.
