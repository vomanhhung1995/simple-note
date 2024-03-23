#run enviroment
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml

#deploy
kubectl apply -f udagram-api-user-deployment.yaml
kubectl apply -f udagram-api-user-service.yaml
kubectl apply -f udagram-api-feed-deployment.yaml
kubectl apply -f udagram-api-feed-service.yaml
kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f reverseproxy-service.yaml

#external
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy --port=8080

#FE
kubectl apply -f udagram-frontend-deployment.yaml
kubectl apply -f udagram-frontend-service.yaml
kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend