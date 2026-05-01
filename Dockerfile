FROM jlesage/firefox:latest

# Bake in privacy configuration and CJK support settings
# Note: /config is a volume in the base image, but we populate it here for portability.
COPY config/ /config/

# Ensure the container user has permissions to the config directory
RUN chown -R 1000:1000 /config

# Native CJK font support is handled via the ENABLE_CJK_FONT env var in docker-compose
# but we can also set it as a default in the image for standalone runs.
ENV ENABLE_CJK_FONT=1

