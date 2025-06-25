#!/bin/bash
set -e

cp -r --no-preserve=mode,ownership,timestamps /bitnami/wordpress/. /opt/bitnami/wordpress/

if [[ $# -eq 0 ]]; then
  set -- "/opt/bitnami/scripts/apache/run.sh"
fi

exec /opt/bitnami/scripts/wordpress/entrypoint.sh "$@"