FROM jlesage/firefox:latest

# Setup repositories and install packages in a single layer to minimize size
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
    boost-iostreams \
    fcitx5 \
    fcitx5-chinese-addons \
    fcitx5-configtool \
    fcitx5-gtk \
    fcitx5-qt

COPY './openbox/startup.sh' '/etc/services.d/openbox/'

# Bake in privacy configuration and CJK support settings
# Note: /config is a volume in the base image, but we populate it here for portability.
COPY config/ /config/

# Combine permission changes and configuration in one layer
RUN chmod +x '/etc/services.d/openbox/startup.sh' && \
    sed -i 's#touch /var/run/openbox/openbox.ready#sh -c /etc/services.d/openbox/startup.sh#' /etc/services.d/openbox/params && \
    chown -R 1000:1000 /config

# Consolidate environment variables
ENV GTK_IM_MODULE=fcitx5 \
    QT_IM_MODULE=fcitx5 \
    ENABLE_CJK_FONT=1 \
    XMODIFIERS=@im=fcitx5
