#!/bin/bash

R="\e[32m"
G="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/madan/logs"

if [ -d $SOURCE_DIR ]

then
    echo -e "$SOURCE_DIR $G is exists: $N"
else
    echo "$SOURCE_DIR $R is does not exists: $N"
    exit 1
fi    

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +10)

echo "files :: $FILES"

while IFS= read -r line
do
      echo "deleting lines: $line"

done >>> $FILES