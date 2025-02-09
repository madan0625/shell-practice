#!/bin/bash

SUBJECTS=("telugu" "hindi" "english" "maths" "science" "social")
TOTALM=600
i=6
TOTAL=0

for i in {0..5}
do
echo "subject name : ${SUBJECTS[$i]}"
echo "enter marks :"
read MARKS
echo "entered marks : $MARKS"

TOTAL=$((TOTAL+MARKS))

done

echo "total marks : $TOTAL"
PERCENTAGE=$(echo "scale=2; ($TOTAL/$TOTALM)*100" | bc)
echo "secured percentage is : $PERCENTAGE"


if [ $PERCENTAGE -ge 90  ]
then
   echo "you got distinction with : $TOTAL marks"
fi






#perecentage = marks/ secured *100