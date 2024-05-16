# MicroShop

> By **Bartholomé GILI** & **Bastien BOMBARDELLA**.

By **Bartholomé GILI** & **Bastien BOMBARDELLA**

## Requirements

- [Docker](https://www.docker.com/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Helm](https://helm.sh/)

## Usage

You **must execute this command** to push the images directly to the in-cluster Docker daemon (docker-env)

```sh
eval $(minikube docker-env)
```

You **also must execute this commands** that would be useful for our load balancers to work

```sh
minikube tunnel
```


> [!NOTE]
> A `Makefile` is provided to simplify the usage of the project.
> You can run `make help` to see all available commands.
> And run `make` to deploy the whole thing.

1. Build the docker images
    ```bash
    cd services/<service_name>
    docker build -t <service_name>-service:1.0.0 .
    ```
2. Deploy the services using helm
    ```bash
    helm upgrade <app_name> kubernetes -f kubernetes/values.yaml --force --install --namespace <app_name> --create-namespace
    ```
