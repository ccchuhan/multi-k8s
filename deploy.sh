docker build -t chuhanfeng/multi-client:latest -t chuhanfeng/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t chuhanfeng/multi-server:latest -t chuhanfeng/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t chuhanfeng/multi-worker:latest -t chuhanfeng/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push chuhanfeng/multi-client:latest
docker push chuhanfeng/multi-server:latest
docker push chuhanfeng/multi-worker:latest
docker push chuhanfeng/multi-client:$SHA
docker push chuhanfeng/multi-server:$SHA
docker push chuhanfeng/multi-worker:$SHA
kubectl apply -f k8s
#kubectl set image deployments/server-deployment server=chuhanfeng/multi-server:$SHA
#kubectl set image deployments/client-deployment client=chuhanfeng/multi-client:$SHA
#kubectl set image deployments/worker-deployment worker=chuhanfeng/multi-worker:$SHA
