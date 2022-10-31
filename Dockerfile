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
