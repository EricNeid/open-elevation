FROM ghcr.io/osgeo/gdal:ubuntu-small-3.8.4

ARG BUILD_VERSION

LABEL version=$BUILD_VERSION
LABEL maintainer="eric.neidhardt@gmail.com"

ENV PYTHONUNBUFFERED=1
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    python3-dev \
    dos2unix \
    build-essential \
    curl \
    wget \
    libspatialindex-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY . /code
RUN dos2unix /code/prepare-create-dataset.sh & \
    dos2unix /code/prepare-create-tiles.sh & \
    dos2unix /code/prepare-download-srtm.sh & \
    dos2unix /code/entrypoint.sh

RUN chmod +x /code/prepare-create-dataset.sh & \
    chmod +x /code/prepare-create-tiles.sh & \
    chmod +x /code/prepare-download-srtm.sh & \
    chmod +x /code/entrypoint.sh

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]

#CMD ["python3", "server.py"]
