FROM timescale/timescaledb:latest-pg18

RUN apk add --no-cache gettext

WORKDIR /docker-entrypoint-initdb.d

COPY services.conf .
COPY provision/ ./

RUN chmod +x ./provision.sh

EXPOSE 5432
