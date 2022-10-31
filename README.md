# Install docker

 Set up the repository
 <pre>sudo apt-get update </pre>

 <pre>
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
</pre>
 Install

<pre>
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
</pre>

check

<pre>
sudo docker run hello-world
</pre>


# Dockerfile

* install requirements

* install lib for opencv

* download model and config for YOLOv4

* Environment: python 3.9

<pre>
FROM python:3.9

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN mkdir /app/model
WORKDIR /app/model
RUN export PATH="$HOME/.local/bin:$PATH"
RUN gdown 1peJc9qdBXWVnmP1YH7JCx0dcq3nJJTGw
RUN gdown 1VV5Qx6-K6ls4XaKdi33y38i-lV2MXuFJ


WORKDIR /app
CMD ["python3", "server.py"]

</pre>

# docker-compose file

<pre>
version: "3.9"

services:
  app:
    image: deploy-model
    ports:
      - "0.0.0.0:8080"
    restart: unless-stopped
</pre>

# Pull and run image:
 <pre> docker pull phuvinh010701/deploy-model-to-aws </pre>
 <pre> docker run --publish 8080:8080 phuvinh010701/deploy-model-to-aws </pre>

# Build and run on localhost
 build image
 <pre> docker build -t deploy-model . </pre>
 
 check image exists

 <pre> docker images </pre>
 
 run
 
 <pre> docker-compose up </pre>

 localhost:8080
