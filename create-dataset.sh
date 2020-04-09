#!/usr/bin/env bash

OUTDIR="data"
if [ ! -e $OUTDIR ] ; then
    echo $OUTDIR does not exist!
fi

cd $OUTDIR

echo Downloading data...
../download-srtm-data.sh

echo Creating tiles: SRTM_NE_250m
../create-tiles.sh SRTM_NE_250m.tif 10 10 && \
rm -rf SRTM_NE_250m.tif

echo Creating tiles: SRTM_SE_250m
../create-tiles.sh SRTM_SE_250m.tif 10 10 && \
rm -rf SRTM_SE_250m.tif

echo Creating tiles: SRTM_W_250m
../create-tiles.sh SRTM_W_250m.tif 10 20 && \
rm -rf SRTM_W_250m.tif

echo removing unused data
rm -rf readme.txt

echo Finished creating dataset
