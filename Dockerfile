ARG PHP_VERSION=latest
FROM owncloudci/php:$PHP_VERSION
MAINTAINER ownCloud DevOps <devops@owncloud.com>

VOLUME ["/mnt/data"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/usr/local/bin/owncloud"]

RUN a2enmod rewrite headers env dir mime ssl expires && \
  mkdir -p /var/www/owncloud /mnt/data/files /mnt/data/config /mnt/data/certs /mnt/data/sessions && \
  chown -R www-data:www-data /var/www/owncloud /mnt/data && \
  chsh -s /bin/bash www-data

COPY rootfs /
WORKDIR /var/www/owncloud

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>"
LABEL org.label-schema.vcs-url="https://github.com/owncloud-docker/base.git"
LABEL org.label-schema.name="ownCloud Base"
LABEL org.label-schema.vendor="ownCloud GmbH"
LABEL org.label-schema.schema-version="1.0"