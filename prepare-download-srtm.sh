#!/usr/bin/env bash

set -eu

echo "Downloading srtm"
wget -N --no-if-modified-since http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_NE_250m_TIF.rar
/usr/bin/unar -f SRTM_NE_250m_TIF.rar -o ../data -D

wget -N --no-if-modified-since http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_SE_250m_TIF.rar
/usr/bin/unar -f SRTM_SE_250m_TIF.rar -o ../data -D

wget -N --no-if-modified-since http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_W_250m_TIF.rar
/usr/bin/unar -f SRTM_W_250m_TIF.rar -o ../data -D

echo "Finished downloading srtm"
