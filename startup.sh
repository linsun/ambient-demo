#!/bin/bash

echo "Create the kind cluster..."
kind create cluster --config cluster.yaml

docker pull docker.io/linsun/demo:v2
docker pull docker.io/linsun/rag:v2
docker pull docker.io/linsun/rag:v1
docker pull docker.io/linsun/curl:latest
docker pull quay.io/kiali/kiali:v2.5
docker pull ghcr.io/prometheus-operator/prometheus-config-reloader:v0.78.2
docker pull docker.io/prom/prometheus:v3.1.0

docker pull docker.io/istio/proxyv2:1.25.0-distroless
docker pull docker.io/istio/pilot:1.25.0-distroless
docker pull docker.io/istio/install-cni:1.25.0-distroless
docker pull docker.io/istio/ztunnel:1.25.0-distroless
docker pull docker.io/istio/pilot:1.25.0-distroless


kind load docker-image docker.io/linsun/demo:v2
kind load docker-image docker.io/linsun/curl:latest
kind load docker-image docker.io/linsun/rag:v2
kind load docker-image docker.io/linsun/rag:v1

kind load docker-image docker.io/istio/proxyv2:1.25.0-distroless
kind load docker-image docker.io/istio/pilot:1.25.0-distroless
kind load docker-image docker.io/istio/install-cni:1.25.0-distroless
kind load docker-image docker.io/istio/ztunnel:1.25.0-distroless
kind load docker-image docker.io/istio/pilot:1.25.0-distroless

kind docker-image quay.io/kiali/kiali:v2.5
kind docker-image ghcr.io/prometheus-operator/prometheus-config-reloader:v0.78.2
kind docker-image docker.io/prom/prometheus:v3.1.0

echo "Applying the Kubernets manifests..."

kubectl apply -f kubernetes/client.yaml

kubectl apply -f kubernetes/demo.yaml
kubectl apply -f kubernetes/rag.yaml

