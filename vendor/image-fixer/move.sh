#!/usr/bin/env bash

BOLD=$(tput bold)
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

printf "${BLUE} ${BOLD} Moving FRANCE images to ephemeral storage... ${NC}"
echo ' '

cd France
cp "1.jpg" "../../../public/images/France/1.jpg"
cp "2.jpg" "../../../public/images/France/2.jpg"
cp "3.jpg" "../../../public/images/France/3.jpg"
cp "D4.jpg" "../../../public/images/France/D4.jpg"
cp "4.jpg" "../../../public/images/France/4.jpg"
cp "5.jpg" "../../../public/images/France/5.jpg"
cp "J6.jpg" "../../../public/images/France/J6.jpg"
cp "6.jpg" "../../../public/images/France/6.jpg"
cp "7.jpg" "../../../public/images/France/7.jpg"
cp "8.jpg" "../../../public/images/France/8.jpg"
cp "9.jpg" "../../../public/images/France/9.jpg"
cp "10.jpg" "../../../public/images/France/10.jpg"
cp "D11.jpg" "../../../public/images/France/D11.jpg"
cp "11.jpg" "../../../public/images/France/11.jpg"
cp "12.jpg" "../../../public/images/France/12.jpg"
cp "13.jpg" "../../../public/images/France/13.jpg"
cp "14.jpg" "../../../public/images/France/14.jpg"
cp "15.jpg" "../../../public/images/France/15.jpg"
cp "16.jpg" "../../../public/images/France/16.jpg"
cp "18.jpg" "../../../public/images/France/18.jpg"
cp "D19.jpg" "../../../public/images/France/D19.jpg"
cp "20.jpg" "../../../public/images/France/20.jpg"
cp "21.jpg" "../../../public/images/France/21.jpg"
cp "22.jpg" "../../../public/images/France/22.jpg"
cp "23.jpg" "../../../public/images/France/23.jpg"
cp "24.jpg" "../../../public/images/France/24.jpg"
cp "25.jpg" "../../../public/images/France/25.jpg"
cp "26.jpg" "../../../public/images/France/26.jpg"

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '
echo ' '

cd ..


printf "${BLUE} ${BOLD} Moving GREAT BRITAIN images to ephemeral storage... ${NC}"
echo ' '

cd 'Great Britain'
cp "1.jpg" "../../../public/images/Great Britain/1.jpg"

printf "${BLUE} ${BOLD} Done. ${NC}"
echo ' '
echo ' '

cd ..

