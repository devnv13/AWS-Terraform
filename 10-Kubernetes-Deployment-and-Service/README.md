
# aws configure
AWS Access Key ID [None]: XXXX
AWS Secret Access Key [None]: XXXX
Default region name [None]: us-east-1
Default output format [None]: 

# aws eks --region us-east-1 update-kubeconfig --name eks-demo

# kubectl create ns test

# kubectl config set-context --current --namespace=test

# To create image pull secret. Provide docker password

kubectl create secret docker-registry registrycred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=devnv \
  --docker-password=XXXX -n test


# To describe Subnets: (replace actual VPC ID value)

aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-092be243df86fb139" --query "Subnets[].{ID:SubnetId,Tags:Tags}" --output table

# Apply deployment and service yaml files

kubectl apply -f 01-Deployment.yaml
kubectl apply -f 02-CLB-LoadBalancer-Service.yaml
kubectl apply -f 04-NLB-LoadBalancer-Service.yaml 

[root@ip-10-0-1-143 kubernetes-manifests]# kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
nginxapp-deployment-7fc99f6656-q4vwq   1/1     Running   0          70m
nginxapp-deployment-7fc99f6656-z6cdn   1/1     Running   0          70m

[root@ip-10-0-1-143 kubernetes-manifests]# kubectl get svc
NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP                                                                     PORT(S)        AGE
nginxapp-lb-service       LoadBalancer   172.20.243.38   aa159b647b66b463d883d1377a305ae2-298043770.us-east-1.elb.amazonaws.com          80:32359/TCP   55m
nginxapp-lb-service-nlb   LoadBalancer   172.20.19.217   aca783c275097437cae74f3af37edcd6-293b10289b693337.elb.us-east-1.amazonaws.com   80:30994/TCP   11m


# Check status of CLB and NLB Services

# curl http://aa159b647b66b463d883d1377a305ae2-298043770.us-east-1.elb.amazonaws.com
<p>Hello added Container success after new build-ssh. Also update with latest!!!</p>

# curl http://aca783c275097437cae74f3af37edcd6-293b10289b693337.elb.us-east-1.amazonaws.com
<p>Hello added Container success after new build-ssh. Also update with latest!!!</p>





