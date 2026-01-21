#!/usr/bin/env bash

echo Downloading srtm &&
wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_NE_250m_TIF.rar &&
/usr/bin/unar -f SRTM_NE_250m_TIF.rar -o ../data -D &&
rm -rf SRTM_NE_250m_TIF.rar

wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_SE_250m_TIF.rar &&
/usr/bin/unar -f SRTM_SE_250m_TIF.rar -o ../data -D &&
rm -rf SRTM_SE_250m_TIF.rar

wget -nc http://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_W_250m_TIF.rar &&
/usr/bin/unar -f SRTM_W_250m_TIF.rar -o ../data -D &&
rm -rf SRTM_W_250m_TIF.rar

echo Finished downloading srtm
