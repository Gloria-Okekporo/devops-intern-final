\# Loki and Promtail Monitoring



\## Overview



The project uses Grafana Loki and Promtail to collect and query Docker container logs.



The monitoring stack runs with Docker Compose:



\- Loki: log aggregation and storage

\- Promtail: Docker log collection agent

\- NGINX application: log source



\## Start the monitoring stack



```powershell

docker compose -f monitoring\\docker-compose.yaml up -d

