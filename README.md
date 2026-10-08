\---



\## Project Overview



This project demonstrates a complete DevOps workflow for a containerized NGINX application.



The implementation covers:



\- Git source control and incremental commit history

\- Linux shell scripting

\- Docker containerization

\- Non-root container execution

\- Docker health checks

\- Build metadata injection using Git commit SHA

\- GitHub Actions CI/CD

\- GitHub Container Registry publishing configuration

\- HashiCorp Nomad deployment configuration

\- Consul service registration and health checking

\- Grafana Loki and Promtail log aggregation

\- LogQL-based log querying

\- Operational documentation and troubleshooting



\---



\## Architecture



```mermaid

flowchart LR

&#x20;   Developer\[Developer]

&#x20;   Git\[Git Repository]

&#x20;   Actions\[GitHub Actions]

&#x20;   GHCR\[GitHub Container Registry]

&#x20;   Docker\[Docker / NGINX]

&#x20;   Nomad\[HashiCorp Nomad]

&#x20;   Consul\[Consul]

&#x20;   Promtail\[Promtail]

&#x20;   Loki\[Grafana Loki]



&#x20;   Developer --> Git

&#x20;   Git --> Actions

&#x20;   Actions --> Docker

&#x20;   Actions --> GHCR

&#x20;   GHCR --> Nomad

&#x20;   Nomad --> Docker

&#x20;   Docker --> Consul

&#x20;   Docker --> Promtail

&#x20;   Promtail --> Loki



\---



\## Repository Structure



```text

devops-intern-final/

├── README.md

├── .gitignore

├── app/

│   ├── Dockerfile

│   ├── index.html

│   └── nginx.conf

├── scripts/

│   ├── sysinfo.sh

│   └── healthcheck.sh

├── .github/

│   └── workflows/

│       └── ci.yml

├── nomad/

│   └── nginx-app.nomad.hcl

├── monitoring/

│   ├── docker-compose.yaml

│   ├── loki-config.yaml

│   └── promtail-config.yaml

└── docs/

&#x20;   ├── loki\_setup.md

&#x20;   └── screenshots/



\## Application Structure



The NGINX application is contained in the `app/` directory:



```text

app/

├── Dockerfile

├── index.html

└── nginx.conf
