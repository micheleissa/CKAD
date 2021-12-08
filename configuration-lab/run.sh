kubectl apply -f db-password-secret.yaml

kubect get secrets


kubectl apply -f candy-service-config.yaml

kubectl get configmap


kubectl apply -f candy-service-pod.yaml

kubectl get pods -o wide

kubect describde pods {pod-name}