FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04
COPY .condarc /root/
COPY conda_env /root/
SHELL ["/bin/bash", "-c"] 
RUN apt update || true \
    && apt install -y wget vim bzip2 unzip \
    && cd ~ \
    ## 如果该文件下载速度慢，请自行更换合适的下载源
    && wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.3.1-Linux-x86_64.sh \
    && chmod 777 ~/Anaconda3-5.3.1-Linux-x86_64.sh \
    && ~/Anaconda3-5.3.1-Linux-x86_64.sh -b \
    && rm ~/Anaconda3-5.3.1-Linux-x86_64.sh \
    && cat ~/conda_env >> ~/.bashrc \
    && cat ~/.bashrc \
    && source ~/.bashrc \
    && chmod 777 /root/anaconda3/etc/profile.d/conda.sh \
    && . /root/anaconda3/etc/profile.d/conda.sh \
    && conda create -y -n tf1 python=3.7 \
    && conda activate tf1 \
    && conda install -y tensorflow-gpu=1.13 \
    ## 如果该文件下载速度慢，请自行更换合适的下载源
    && pip install -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple logbook \
    && pip install -i https://mirrors.sjtug.sjtu.edu.cn/pypi/web/simple scikit_learn==0.23.1 
