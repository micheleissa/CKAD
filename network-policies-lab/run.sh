kubectl get networkpolicy
kubectl describe networkpolicy inventory-policy
# example on how to get the content of the deployed kind
kubectl get deploy deploymentname -o yaml
#test the network policies
kubectl exec web-gateway -- curl -m 3 customer-data-svc
