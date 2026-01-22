#!/usr/bin/env bash

set -eu

OUTDIR="data"
if [ ! -d "$OUTDIR" ]; then
  mkdir "$OUTDIR"
  echo "Directory '$OUTDIR' created."
else
  echo "Directory '$OUTDIR' already exists."
fi

cd $OUTDIR

echo "Downloading data..."
../prepare-download-srtm.sh

echo "Creating tiles: SRTM_NE_250m"
../prepare-create-tiles.sh SRTM_NE_250m.tif 10 10 && \
rm -rf SRTM_NE_250m.tif

echo "Creating tiles: SRTM_SE_250m"
../prepare-create-tiles.sh SRTM_SE_250m.tif 10 10 && \
rm -rf SRTM_SE_250m.tif

echo "Creating tiles: SRTM_W_250m"
../prepare-create-tiles.sh SRTM_W_250m.tif 10 20 && \
rm -rf SRTM_W_250m.tif

echo "removing unused data"
rm -rf readme.txt

echo "Finished creating dataset"
