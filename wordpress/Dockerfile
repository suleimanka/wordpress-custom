FROM bitnami/wordpress:latest

USER root

RUN install_packages cron vim

COPY --chmod=+x custom-entrypoint.sh /custom-entrypoint.sh

USER 1001

ENTRYPOINT ["/custom-entrypoint.sh"]