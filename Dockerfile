FROM ghcr.io/osgeo/gdal:ubuntu-small-3.10.1

ARG BUILD_VERSION

LABEL version=$BUILD_VERSION
LABEL maintainer="eric.neidhardt@gmail.com"

ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV CINCLUDE_PATH=/usr/include/gdal
ENV TZ=UTC

RUN apt-get update
RUN apt-get install -y \
    libspatialindex-dev \
    unar \
    bc \
    python3-pip \
    wget \
    dos2unix \
    libgdal-dev \
    gdal-bin

WORKDIR /code
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /code
RUN dos2unix *.sh
RUN chmod +x *.sh

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 8080
EXPOSE 8443
