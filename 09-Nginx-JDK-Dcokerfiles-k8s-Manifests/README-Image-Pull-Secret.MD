How to create Image Pull Secret:

kubectl create secret docker-registry registrycred \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=<docker-hub-username> \
  --docker-password=<docker-hub-password> -n test

