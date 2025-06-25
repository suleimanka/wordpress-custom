#!/bin/bash
set -e

cp -r /bitnami/wordpress/. /opt/bitnami/wordpress/ || true

if [[ $# -eq 0 ]]; then
  set -- "/opt/bitnami/scripts/apache/run.sh"
fi

exec /opt/bitnami/scripts/wordpress/entrypoint.sh "$@"