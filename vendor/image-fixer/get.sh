#!/usr/bin/env bash

BOLD=$(tput bold)
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

printf "${BLUE} ${BOLD} Downloading the FRANCE catalog TIFFs... ${NC}"
echo ' '

curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/1.TIF
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/2.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/3.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/D4.TIF
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/4.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/5.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/J6.TIF
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/6.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/7.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/8.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/9.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/10.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/D11.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/11.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/12.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/13.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/14.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/15.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/16.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/18.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/D19.TIF
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/20.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/21.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/22.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/23.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/24.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/25.TIF 
curl -O https://s3.amazonaws.com/oreo-catalog-images/CATIMAGES/IMGSTORE/France/Resized/26.TIF

mv *.TIF France

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '
echo ' '

printf "${BLUE} ${BOLD} Downloading the FRANCE catalog TIFFs... ${NC}"
echo ' '

mv *.TIF 'Great Britain'

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '

