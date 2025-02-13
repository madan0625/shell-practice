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