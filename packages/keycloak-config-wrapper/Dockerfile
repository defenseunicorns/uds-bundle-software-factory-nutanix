# TODO - should load name from var
# renovate: datasource=github-tags depName=defenseunicorns/uds-identity-config versioning=semver 
FROM ghcr.io/defenseunicorns/uds/identity-config:0.3.6

WORKDIR /home/nonroot

# Copy Jars from the plugin build stage
COPY --chown=nonroot *.jar .
