#!/bin/sh
set -eu
: "${SECRET_SNOWFLAKE_PRIVATE_KEY_PASSWORD:?Falta la variable de Kestra en .env.snowflake}"
: "${SNOWFLAKE_ACCOUNT:?Falta SNOWFLAKE_ACCOUNT en .env.dbt}"
export DBT_PRIVATE_KEY_PASSPHRASE="$(printf '%s' "$SECRET_SNOWFLAKE_PRIVATE_KEY_PASSWORD" | base64 -d)"
exec dbt "$@" --profiles-dir /usr/app
