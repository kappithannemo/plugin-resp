FROM node:latest

RUN  apt-get update \
     && git clone https://github.com/kappithannemo/plugin-resp.git \
     && cd plugin-resp \
     && virtualenv -p /usr/bin/python3 venv \
     && . ./venv/bin/activate \
     && pip install -r requirements.txt \
     
     
     
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD python3 main.py
EXPOSE 8080
