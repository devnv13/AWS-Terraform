Build Dokcer Images:
===================

For openjdk image:
-----------------
# docker build -t devnv/openjdk-11-demo:1.0.0 .

# docker push docker.io/devnv/openjdk-11-demo:1.0.0

mysql-8 demo image 
------------------

# docker build -t devnv/mysql8-demo:1.0.0 .

# docker push docker.io/devnv/mysql8-demo:1.0.0

Check docker images locally
--------------------------

# docker images | grep -i openjdk
devnv/openjdk-11-demo   1.0.0     a5403788ede3   3 hours ago    426MB
devnv/openjdk-11-demo   <none>    10dc65dd28d5   3 hours ago    426MB
devnv/openjdk-11-demo   <none>    668eaeed6df6   13 hours ago   298MB
devnv/openjdk-11-demo   <none>    d58134917205   13 hours ago   426MB
openjdk-11-demo         latest    521184fadd9b   17 hours ago   424MB
devnv/openjdk-11-demo   <none>    521184fadd9b   17 hours ago   424MB

Login into image after run:
--------------------------

# docker run -it --entrypoint sh a5403788ede3
