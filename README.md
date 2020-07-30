#   SLU环境搭建

##  文件说明:

### Dockerfile:
dockerfile文件，记录镜像搭建流程

### .condarc：
conda配置文件，用于配置conda镜像源，如该镜像源在贵公司不可用，请自行更换合适的镜像源

### conda_env：
用于修改~/.bashrc，激活conda环境

##  使用流程：
*   进入slu_docker文件夹下
*   运行：docker build -t slu_env . 
*   运行：docker run -t -i  --gpus 2 --name=slu_docker slu_env
*   运行：docker exec -ti slu_docker /bin/bash