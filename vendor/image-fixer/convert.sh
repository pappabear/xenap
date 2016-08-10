#!/usr/bin/env bash

BOLD=$(tput bold)
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

printf "${BLUE} ${BOLD} Converting France catalog images to usage jpg format... ${NC}"
echo ' '
mkdir France
cd France
convert /raw_images/CATIMAGES/IMGSTORE/France/*.TIF *.jpg

printf "${BLUE} ${BOLD} Converting Alexandretta catalog images to usage jpg format... ${NC}"
echo ' '
cd ..
mkdir Alexandretta
cd Alexandretta
convert /raw_images/CATIMAGES/IMGSTORE/France/*.tif *.jpg

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '
echo ' '

cd ..

echo ' '

