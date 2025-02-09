#!/bin/bash

SUBJECTS=("telugu" "hindi" "english" "maths" "science" "social")
TOTALM=100
i=6
TOTAL=0

for i in {0..5}
do
echo "enter subject name : ${SUBJECTS[$i]}"
echo "enter marks :"
read MARKS
echo "entered marks : $MARKS"

TOTAL=$((TOTAL+MARKS))

echo "total marks : $TOTAL" 

#PERCENTAGE=$(echo "scale=2; ($MARKS/$TOTALM)*100" | bc)

#echo "secured percentage is : $PERCENTAGE%"
done








#perecentage = marks/ secured *100