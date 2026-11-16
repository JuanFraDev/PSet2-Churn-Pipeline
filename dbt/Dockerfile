FROM python:3.11-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*
RUN python -m pip install --no-cache-dir dbt-snowflake==1.12.4
COPY entrypoint.sh /usr/local/bin/dbt-entrypoint
RUN chmod 755 /usr/local/bin/dbt-entrypoint
WORKDIR /usr/app
