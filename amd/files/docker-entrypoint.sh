#!/bin/bash

docker_host=$(curl rancher-metadata/latest/self/host/name | cut -d'.' -f1)

# Generate pool config
cat > /opt/pool.cfg <<-EOH
{
  "pools": [
    {
      "name": "MoneroPool",
      "nfactor": "10",
      "algorithm": "cryptonight",
      "url": "$URL",
      "user": "$USER.0.$docker_host",
      "pass": "$PASS",
      "priority": "0",
      "profile": "xmr"
    }
  ],
  "api-port": "4028",
  "failover-only": true,
  "profiles": "xmr",
  "name": "xmr",
  "api-listen": true,
  "api-allow": "W:127.0.0.1/24,W:192.168.1.0/24",
  "rawintensity": "512",
  "worksize": "4",
  "gpu-threads": "$THREADS",
  "gpu-fan": "70",
  "default-profile": "xmr",
  "no-submit-stale": true,
  "no-extranonce": true
}
EOH

exec "$@"
