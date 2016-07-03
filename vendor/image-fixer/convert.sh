#!/usr/bin/env bash

BOLD=$(tput bold)
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

printf "${BLUE} ${BOLD} Converting FRANCE catalog images to usage jpg format... ${NC}"
echo ' '

cd France
convert 1.TIF 1.jpg
convert 2.TIF 2.jpg
convert 3.TIF 3.jpg
convert D4.TIF D4.jpg
convert 4.TIF 4.jpg
convert 5.TIF 5.jpg
convert J6.TIF J6.jpg
convert 6.TIF 6.jpg
convert 7.TIF 7.jpg
convert 8.TIF 8.jpg
convert 9.TIF 9.jpg
convert 10.TIF 10.jpg
convert D11.TIF D11.jpg
convert 11.TIF 11.jpg
convert 12.TIF 12.jpg
convert 13.TIF 13.jpg
convert 14.TIF 14.jpg
convert 15.TIF 15.jpg
convert 16.TIF 16.jpg
convert 18.TIF 18.jpg
convert D19.TIF D19.jpg
convert 20.TIF 20.jpg
convert 21.TIF 21.jpg
convert 22.TIF 22.jpg
convert 23.TIF 23.jpg
convert 24.TIF 24.jpg
convert 25.TIF 25.jpg
convert 26.TIF 26.jpg
printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '
echo ' '

cd ..

printf "${BLUE} ${BOLD} Converting GREAT BRITAIN catalog images to usable jpg format... ${NC}"
echo ' '

cd 'Great Britain'

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '

cd ..

echo ' '

