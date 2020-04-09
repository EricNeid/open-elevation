#!/usr/bin/env bash

OUTDIR="/code/data"
if [ ! -e $OUTDIR ] ; then
    echo $OUTDIR does not exist!
fi

CUR_DIR=$(pwd)

set -eu

cd $OUTDIR
../download-srtm-data.sh
echo 'Creating tiles from SRTM_NE_250m_TIF/SRTM_NE_250m.tif'
../create-tiles.sh SRTM_NE_250m_TIF/SRTM_NE_250m.tif 10 10

echo 'Creating tiles from SRTM_SE_250m_TIF/SRTM_SE_250m.tif'
../create-tiles.sh SRTM_SE_250m_TIF/SRTM_SE_250m.tif 10 10

echo 'Creating tiles from SRTM_W_250m_TIF/SRTM_W_250m.tif'
../create-tiles.sh SRTM_W_250m_TIF/SRTM_W_250m.tif 10 20

echo 'Cleaning up'
rm -rf SRTM_NE_250m_TIF
rm -rf SRTM_SE_250m_TIF
rm -rf SRTM_W_250m_TIF
rm -rf *.rar

echo 'Finished creating dataset'

cd $CUR_DIR
