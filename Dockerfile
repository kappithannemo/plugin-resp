FROM node:15.2.0-alpine3.10

RUN apk add --no-cache --update \
    ffmpeg \
    libwebp \
    postgresql \
    sudo \
    git \
    neofetch \
    libwebp \
    libffi \
    libc-dev \
    gcc \
    libxslt-dev \
    libjpeg \
    libpng \
    libwebp-dev \
    libffi \
    libffi-dev \
    libc-dev \
    libxslt-dev \
    libjpeg-turbo-dev \
    python3 \
    python3-dev \
    chromium \
    chromium-chromedriver \
    py3-pip \
    bash \
    postgresql-dev \
    musl-dev

RUN git clone https://github.com/kappithannemo/plugin-resp /root/plugin-resp
RUN mkdir /root/plugin-resp/bin/
WORKDIR /root/plugin-resp/

ENV TZ=Europe/Istanbul
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies \
     virtualenv -p /usr/bin/python3 venv \
  . ./venv/bin/activate \
  pip install -r requirements.txt

CMD ["python3 main.py"]
