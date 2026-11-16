FROM apache/spark:4.0.0-python3
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*
USER 185
