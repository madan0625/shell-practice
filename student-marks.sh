#!/bin/bash

SUBJECTS=("telugu" "hindi" "english" "maths" "science" "social")
TOTALM=100



echo "enter subject name : ${SUBJECTS[0]}"
echo "enter marks :"
read MARKS
echo "entered marks : $MARKS"
percentage=$(($MARKS/$TOTALM)100)

echo "secured percentage is : $percentage"









#perecentage = marks/ secured *100