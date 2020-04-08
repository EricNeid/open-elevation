FROM geodata/gdal:2.1.3

LABEL version="0.1.0"
LABEL maintainer="eric.neidhardt@gmail.com"

# install requirements
ADD ./requirements.txt .
RUN pip install -r requirements.txt

# installing required apt packages
RUN apt-get update && apt-get install -y libspatialindex-dev unar bc dos2unix

# Copy scripts and make sure the line ending is corret
COPY . /code/
RUN dos2unix /code/create-dataset.sh & \
    dos2unix /code/create-tiles.sh & \
    dos2unix /code/download-srtm-data.sh

# Ready to start
WORKDIR /code

CMD python server.py

EXPOSE 8080
