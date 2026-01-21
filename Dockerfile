FROM ghcr.io/osgeo/gdal:ubuntu-small-3.8.4

ARG BUILD_VERSION

LABEL version=$BUILD_VERSION
LABEL maintainer="eric.neidhardt@gmail.com"

ENV PYTHONUNBUFFERED=1
ENV PIP_BREAK_SYSTEM_PACKAGES=1

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    python3-dev \
    dos2unix \
    unar \
    build-essential \
    curl \
    wget \
    libspatialindex-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY . /code
RUN dos2unix *.sh
RUN chmod +x *.sh

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]
