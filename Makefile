.POSIX:
.PHONY: *

# Variables

APP_NAME = microshop
APP_VERSION = 1.0.1
KUBE_DEPLOYMENT_FOLDER = kubernetes

# Global

default: docker.build kube.deploy

# Docker

docker.build:
	cd services/orders && docker build -t orders-service:$(APP_VERSION) .
	cd services/products && docker build -t products-service:$(APP_VERSION) .
	cd services/users && docker build -t users-service:$(APP_VERSION) .

# Kubernetes

kube.deploy:
	helm upgrade $(APP_NAME) $(KUBE_DEPLOYMENT_FOLDER) -f $(KUBE_DEPLOYMENT_FOLDER)/values.yaml --force --install --namespace $(APP_NAME) --create-namespace

kube.delete:
	helm delete $(APP_NAME) --namespace $(APP_NAME)