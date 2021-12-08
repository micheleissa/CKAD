# list pods in default namespace
kubectl get pods 

#list pods in real time
kubectl get pods -w

# list pods along with labels
kubectl get pods --show-labels

# list pods with equality based selector e.g. label=value or label-name!=value 
kubectl get pods -l app=my-app

# list pods with multiple selectors
kubectl get pod -l app=my-app,environment=production

# list pods with set based selector
kubectl get pods -l 'environment in (production, development)'

# update/change the image of a deployment descriptor.
kubectl set image deployment/rolling-deployment nginx=nginx:1.7.9 --record

# Explore the rollout history of the deployment.
kubectl rollout history deployment/rolling-deployment
#Show rollout history of a specific revision
kubectl rollout history deployment/rolling-deployment --revision=2
# You can roll back to the previous revision like so
kubectl rollout undo deployment/rolling-deployment
# Rollout to a specific earlier revision by providing the revision number
kubectl rollout undo deployment/rolling-deployment --to-revision=1



# describe pod in a specific format
kubectl describe pod <pod--name> -o yaml|json

# describe pod in a specific format then export it to a file
kubectl describe pod <pod--name> -o yaml|json --export > <filename>

# list pods in a specific namespace ( e.g. my-ns)
kubectl get pods -n my-ns

# list services in default namespace
kubectl get svc

# list ingress in default namespace
kubectl get ingress

# list all deployments
kubectl get deployments -A

#edit a specific deployment
kubectl edit deployments <dep-name>

# Run minikube with calico and CNI for networking
# https://github.com/kubernetes/minikube/issues/10382
minikube start --network-plugin=cni --cni=calico

# dry run command to imperatively create descriptor files
# pod
kubectl run hello-pod --image=nginx --restart=Never --dry-run=client -o yaml > hello-pod.yaml
# Expose a pod (using a service and specifying ports and service type)    
kubectl expose po hello-pod --port=80 --target-port=9376 --type=NodePort
# Create Deployment
kubectl create deploy hello-deploy --image=nginx --dry-run=client -o yaml > hello-deploy.yaml
#Update deployment image to nginx:1.17.4:     
kubectl set image deploy/hello-deploy nginx=nginx:1.17.4
#Scale a deployment
kubectl scale deploy hello-deploy --replicas=20
#Create Job
kubectl create job hello-job --image=busybox --dry-run=client -o yaml -- echo "Hello I am from job" > hello-job.yaml

# to display help for a certain command
kubectl run --help

# Output the yaml file of the pod you just created without the cluster-specific information
kubectl get po nginx -o yaml --export

# create nginx pod with port 80 exposed.
kubectl run nginx --image=nginx:1.17.4 --restart=Never --port=80

# Run tmp pod to test if another pod is alive or no
k run tmp --restart=Never --rm --image=busybox -i -- wget -O- {10.12.2.15 - podIP}

# run pod with specified resources
kubectl run test --image=alpine --requests=cpu=100m,memory=256Mi --limits=cpu=200m,memory=512Mi
#Secrets
kubectl create secrets <name of secret> --from-file=hello.txt 
kubectl create secrets <name of secret> --from-literal=key1=value1 

# Labels
kubectl get pods --show-labels //display labels of each pod

kubectl get pods --selector=foo=bar //filter on basis of labels

kubectl label pod <podname> k1=v1 k2=v2 k3=v3 //to add labels

kubectl label pod <podname> k1- //to remove labels

kubectl label pod <podname> k2=v2.1 --overwrite //to overwrite

#Annotations
kubectl annotate pods <podname> description='desc' //add annotations

kubectl annotate pods <podname> description- //to remove annotations

kubectl annotate pods <podname> description='desc2' --overwrite//to overwrite

#Deployment
kubectl create deployment <name> --image=<name> //create deployment

kubectl create deployment <name> --image=<name> -- sleep 300 //with command arguments

kubectl scale deployment <name> --replicas=4 //scale up or down

#Rollback and upgrades
kubectl set image deployment <name of deployment> <name of container>=<new image name> // update image

kubectl rollout status deployment <name of deployment> //see status

kubectl rollout history deployment <name of deployment> //see history 

# Jobs
kubectl create job my-job --image=busybox
# Cron Jobs
kubectl create cronjob my-job --image=busybox --schedule="*/1 * * * *"

# Services
kubectl expose deployment nginx --port=80 --target-port=8000 --type=ClusterIP

kubectl create service nodeport my-ns --tcp=5678:8080
# Get api resources
kubectl api-resources
# alias your command 
alias k='kubectl'
alias kd='kubectl describe'
alias kr='kubectl run'
alias kc='kubectl create'
alias ka='kubectl apply'
alias ke='kubectl explain'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'

 k run tmp --image=nginx:alpine --namespace=sun --restart=Never --rm -i -- curl -m 5 10.105.46.46:9999
 k run tmp --restart=Never --rm -i --image=nginx:alpine -- curl -m 5 sun-srv.sun:9999 

 kubectl get ns # check namespaces
kubectl -n qa get events | grep -i "Liveness probe failed"
kubectl -n alan get events | grep -i "Liveness probe failed"
kubectl -n test get events | grep -i "Liveness probe failed"
kubectl -n production get events | grep -i "Liveness probe failed"

# run nginx pod and expose it on port 80
kubectl run nginx --image=nginx --port=80  --expose 

# label a pod
kubectl label pods <pod-name> key=value

# Update pod 'foo' with the label 'status' and the value 'unhealthy', overwriting any existing value
kubectl label --overwrite pods foo status=unhealthy