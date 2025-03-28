kubectl delete -k ~/src/github.com/linsun/helloworld/base/argo-rollout
kubectl delete -f ~/src/github.com/linsun/helloworld/argo/app/argo-rollout/namespace/default/helloworld-rollout.yaml 
kubectl label namespace default istio.io/dataplane-mode-
kubectl label namespace default istio.io/use-waypoint-
