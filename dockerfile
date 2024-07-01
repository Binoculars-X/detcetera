# pull from devel image instead of base
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

# Set bash as the default shell
ENV SHELL=/bin/bash

# Create a working directory
WORKDIR /app/

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    python3-pip \
    apt-utils \
    vim \
    git \
    wget

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# upgrade pip
RUN python -m pip install --upgrade pip

# build with some basic python packages
RUN pip install \
    numpy \
    torch \
    torchvision \
    torchaudio  \
    jupyterlab

RUN pip install "unsloth[colab-new] @ git+https://github.com/unslothai/unsloth.git"

RUN pip install --no-deps packaging ninja einops flash-attn xformers trl peft accelerate bitsandbytes

RUN pip install ipywidgets widgetsnbextension pandas-profiling

RUN pip install transformers==4.38.0

# start jupyter lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=7777", "--allow-root", "--no-browser"]
EXPOSE 7777
