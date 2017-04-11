#!/bin/sh

exec="/usr/bin/newrelic_haproxy_agent"
prog=$(basename $exec)
config="/etc/newrelic_haproxy_agent.yml"

echo "Creating config file..."

cat << EOF > ${config}
newrelic:
  license_key: ${NEWRELIC_TOKEN}
  verbose: 0
agents:
  ${HOSTNAME}-${NAMESPACE}-frontend:
    uri: http://127.0.0.1:444/;csv
    proxy: http
    proxy_type: FRONTEND
  ${HOSTNAME}-${NAMESPACE}-backend:
    uri: http://127.0.0.1:444/;csv
    proxy: application_backend
    proxy_type: BACKEND
  ${HOSTNAME}-${NAMESPACE}-marketing:
    uri: http://127.0.0.1:444/;csv
    proxy: marketing
    proxy_type: BACKEND

EOF

echo "Starting $prog..."

$exec run -c $config
