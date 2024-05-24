FROM jlesage/firefox:v24.05.1

# Add the edge/testing repository
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Add the edge/main and edge/community repositories for the latest packages
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories


# Install fcitx and fcitx-pinyin
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache \
    boost-iostreams \
    fcitx5 \
    fcitx5-chinese-addons \
    fcitx5-configtool \
    fcitx5-gtk \
    fcitx5-qt

COPY './openbox/startup.sh' '/etc/services.d/openbox/'
RUN chmod +x '/etc/services.d/openbox/startup.sh'\
&& sed -i 's#touch /var/run/openbox/openbox.ready#sh -c /etc/services.d/openbox/startup.sh#' /etc/services.d/openbox/params

ENV GTK_IM_MODULE=fcitx5
ENV QT_IM_MODULE=fcitx5
ENV XMODIFIERS=@im=fcitx5
