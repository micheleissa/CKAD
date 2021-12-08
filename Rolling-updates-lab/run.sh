kubectl get deployments
kubectl get pods -o wide
kubectl set image deployment/candy-deployment candy-ws=linuxacademycontent/candy-service:3
kubectl rollout undo deployment/candy-deployment --to-revision=1
kubectl rollout history deployment/candy-deployment