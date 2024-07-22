# Documentation for the Docker Compose and Makefile Setup

This setup is designed to create a monitoring environment using Docker containers. It includes Prometheus for metrics collection, Node Exporter for node metrics, and Grafana for visualization.

## Makefile

The Makefile provides two targets for managing the environment:

* `up-vm`: This target sets up the environment by creating a Docker network named `vm` if it doesn't exist, ensures the necessary directories are present for data persistence, and starts the services defined in the `docker-compose.yml` file in detached mode.
* `down-vm`: This target stops and removes the services started by `up-vm`, including any orphaned containers.

## docker-compose.yml

This file defines the services that make up the monitoring environment:

* `node-exporter`: This service runs the Node Exporter container, which collects metrics from the host system. It exposes port 9100 for Prometheus to scrape metrics.
* `prometheus`: This service runs the Prometheus container, which collects metrics from the Node Exporter and other sources. It exposes port 9090 for the web interface.
* `grafana`: This service runs the Grafana container, which provides a web interface for visualizing metrics. It depends on Prometheus and uses environment variables to configure the admin user, password, and other settings. It exposes port 3000 for the web interface.

## config/grafana/dashboard.yml

This file configures the default dashboard for Grafana. It specifies the location of the dashboard files and sets the default home dashboard.

To use this setup, run `make up-vm` to start the services. Access Grafana at `http://localhost:3000` and Prometheus at `http://localhost:9090`.
