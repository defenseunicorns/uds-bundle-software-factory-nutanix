# TODO - should load name from var
FROM ghcr.io/defenseunicorns/uds/identity-config:0.3.6

WORKDIR /home/nonroot

# Copy Jars from the plugin build stage
COPY --chown=nonroot --from=plugin /home/build/target/*.jar .
