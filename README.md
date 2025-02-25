# Flask Metrics Helm

A Flask application deployment solution using Helm charts for seamless deployment across development, QA, and production environments.

# Project Structure

```code
FLASK-METRICS-HELM/
├── helm/                     # Helm chart directory
│   ├── charts/               # Dependent charts/subcharts
│   ├── templates/            # Kubernetes resource templates
│   │   ├── _helpers.tpl      # Template helpers and reusable functions
│   │   ├── Deployment.yml    # Deployment configuration
│   │   ├── hpa.yaml          # Horizontal Pod Autoscaler
│   │   └── service.yml       # Service configuration
│   ├── .helmignore           # Files to exclude from Helm packaging
│   ├── Chart.yaml            # Chart metadata and version information
│   ├── values-dev.yaml       # Development environment values
│   ├── values-qa.yaml        # QA environment values
│   ├── values-prod.yaml      # Production environment values
│   └── manifests/            # Additional Kubernetes manifests
├── app.py                    # Main Flask application
├── Dockerfile                # Docker image definition
├── requirements.txt          # Python dependencies
├── dev.yml                   # Development configuration file
├── qa.yml                    # QA configuration file
└── prod.yml                  # Production configuration file
```

# Overview

This project provides a Helm-based deployment solution for a Flask application. It enables consistent application deployment across multiple environments (development, QA, and production) while maintaining environment-specific configurations.

# Feature

- Multi-environment Deployment: Customized configurations for dev, QA, and production
- Horizontal Scaling: HPA configuration for automatic scaling based on metrics
- Environment Isolation: Separate value files to maintain environment-specific settings
- Simplified Deployment Process: Standardized Helm commands for all environments

# Prerequisites

- Kubernetes cluster (v1.18+)
- Helm (v3.0+)
- Docker
- kubectl configured to access your cluster

# Installation & Deployment

## Building the Docker Image

```sh
docker build -t flask-metrics-app:latest .
```

# QA Environment

```sh
helm install flask-app ./helm -f ./helm/values-qa.yaml
```

# Dev Environment

```sh
helm install flask-app ./helm -f ./helm/values-dev.yaml
```

# Prod Environment

```sh
helm install flask-app ./helm -f ./helm/values-prod.yaml
```
# Upgrading Environment

```sh
helm upgrade flask-app ./helm -f ./helm/values-{env}.yaml
```

# Environment-Specific Configurations

Each environment has dedicated configuration files:

- Development: Focuses on debugging, fast iteration, and local resources
- QA: Mirrors production with reduced resource allocation and isolated test data
- Production: Optimized for performance, reliability, and scalability

# Key differences include:

| Configuration | Development | QA | Production |
|---------------|------------|-----|------------|
| Replicas | 1 | 2 | 3+ |
| Resource Limits | Low | Medium | High |
| Metrics Sampling | High frequency | Medium frequency | Standard frequency |
| HPA | Disabled | Enabled | Enabled |
| Ingress | Local domain | qa.example.com | example.com |

