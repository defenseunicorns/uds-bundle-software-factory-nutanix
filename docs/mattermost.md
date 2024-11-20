# Configuration Notes

## SSO

When creating users for Mattermost in Keycloak, be sure to put a `mattermostid` in for the user. If you don't, when you sign into Mattermost "via GitLab" you'll get the `Could not parse auth data out of gitlab user object` error.

![image](screenshots/mattermost-sso-missing-mattermostid.png)

If you create an invalid `mattermostid` (such as a person's name) you'll get an invalid OAuth object error.

What you want to do is have users request mattermost access during signup in Keycloak _OR_ add a number not already in use to their user via a Keycloak admin.

## Enabling Calls

The calls plugin starts out in [test mode](https://docs.mattermost.com/configure/plugins-configuration-settings.html#test-mode). Administrators must turn it on if it's desired.

![image](screenshots/enable-call-plugin.png)

This is presently a known issue (calls don't work). Review [#73](https://github.com/defenseunicorns/uds-bundle-software-factory-nutanix/issues/73) for updates.
