#!/bin/bash

SUBJECTS=("telugu" "hindi" "english" "maths" "science" "social")
TOTALM=100


for (( i=6; i>=0; i-- ))
do
echo "enter subject name : ${SUBJECTS[0]}"
echo "enter marks :"
read MARKS
echo "entered marks : $MARKS"
PERCENTAGE=$(echo "scale=2; ($MARKS/$TOTALM)*100" | bc)

echo "secured percentage is : $PERCENTAGE%"
done








#perecentage = marks/ secured *100