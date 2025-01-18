About Deployment Object 
=======================

Here are five simple and important points about the Deployment object in Kubernetes:

1. Manages Pods Automatically:
A Deployment ensures that the desired number of Pod replicas are running at all times. If a Pod crashes or gets deleted, the Deployment automatically creates a new one.

2. Declarative Updates:
You declare the desired state (e.g., which image to use, how many replicas to run) in the Deployment YAML file, and Kubernetes ensures the actual state matches the desired state.

3. Rolling Updates:
Deployments perform rolling updates, which gradually update Pods with a new version of your application without downtime. If an update fails, it can be rolled back automatically or manually.

4. Scalability:
You can easily scale up or down the number of replicas (Pods) in your Deployment to handle varying traffic loads by simply changing the replicas field.

5. Self-healing:
Deployments monitor the health of the Pods. If a Pod becomes unhealthy or unresponsive, the Deployment replaces it automatically to maintain the application's availability.


# Create Deployment

kubectl create deployment my-first-deployment --image=devnv/kubenginx:1.0.0

kubectl describe deployment my-first-deployment

[root@ip-10-0-1-149 ~]# kubectl get deployment
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
my-first-deployment   1/1     1            1           79s

[root@ip-10-0-1-149 ~]# kubectl get rs
NAME                             DESIRED   CURRENT   READY   AGE
my-first-deployment-56bf4cdc47   1         1         1       88s

# Scale Up the Deployment

[root@ip-10-0-1-149 ~]# kubectl scale deployment my-first-deployment --replicas=5
deployment.apps/my-first-deployment scaled

[root@ip-10-0-1-149 ~]# kubectl get rs
NAME                             DESIRED   CURRENT   READY   AGE
my-first-deployment-56bf4cdc47   5         5         5       4m4s

[root@ip-10-0-1-149 ~]# kubectl get deployment
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
my-first-deployment   5/5     5            5           4m13s

[root@ip-10-0-1-149 ~]# kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
my-first-deployment-56bf4cdc47-4q979   1/1     Running   0          28s
my-first-deployment-56bf4cdc47-6z8mn   1/1     Running   0          28s
my-first-deployment-56bf4cdc47-czwj5   1/1     Running   0          4m18s
my-first-deployment-56bf4cdc47-mnjkt   1/1     Running   0          28s
my-first-deployment-56bf4cdc47-v67n4   1/1     Running   0          28s
[root@ip-10-0-1-149 ~]# 

[root@ip-10-0-1-149 ~]# kubectl scale deployment my-first-deployment --replicas=1
deployment.apps/my-first-deployment scaled

[root@ip-10-0-1-149 ~]# kubectl get pods
NAME                                   READY   STATUS    RESTARTS   AGE
my-first-deployment-56bf4cdc47-4q979   1/1     Running   0          89s

# Scale down deployment 

[root@ip-10-0-1-149 ~]# kubectl scale deployment my-first-deployment --replicas=0
deployment.apps/my-first-deployment scaled

[root@ip-10-0-1-149 ~]# kubectl get pods
No resources found in default namespace.


# Expose Deployment as a Service

Expose Deployment with a service (NodePort Service) to access the application externally (from internet)

# Expose Deployment as a Service

# Expose Deployment as a Service

kubectl expose deployment <Deployment-Name>  --type=NodePort --port=80 --target-port=80 --name=<Service-Name-To-Be-Created>


kubectl expose deployment my-first-deployment --type=NodePort --port=80 --target-port=80 --name=my-first-deployment-service

# kubectl get svc


Update Deployments
==================

We can update deployments using two options
- Set Image
- Edit Deployment


1. Updating Application version V1 to V2 using "Set Image" Option

- Please Check the container name in spec.container.name yaml output and make a note of it and replace in kubectl set image command

# Get Container Name from current deployment

kubectl get deploy my-first-deployment -o yaml

# Update Deployment - SHOULD WORK NOW
kubectl set image deployment/<Deployment-Name> <Container-Name>=<Container-Image> --record=true

kubectl set image deployment/my-first-deployment kubenginx=devnv/nginx-test:1.0.1 --record=true


# Verify Rollout Status (Deployment Status)

- By default, rollout happens in a rolling update model, so no downtime.

# Verify Rollout Status 
kubectl rollout status deployment/my-first-deployment

# Verify Deployment
kubectl get deploy

# Describe Deployment

- Verify the Events and understand that Kubernetes by default do "Rolling Update" for new application releases.
So, we will not have downtime for our application.

# Descibe Deployment
kubectl describe deployment my-first-deployment

# Verify ReplicaSet

- New ReplicaSet will be created for new version

# Verify ReplicaSet
kubectl get rs

# Verify Pods
- Pod template hash label of new replicaset should be present for PODs letting us know these pods belong to new ReplicaSet.

# List Pods
kubectl get po

# Verify Rollout History of a Deployment
- We have the rollout history, so we can switch back to older revisions using revision history available to us.

# Check the Rollout History of a Deployment

kubectl rollout history deployment/<Deployment-Name>

kubectl rollout history deployment/my-first-deployment  --revision=1


# Rollback 

# kubectl rollout undo deployment/my-first-deployment --to-revision=2
deployment.apps/my-first-deployment rolled back

# Access the Application using Public IP

We should see Application Version:V2 whenever we access the application in browser

















