#!/bin/bash

SOURCE_DIR="/home/madan/logs"

if [ -d $SOURCE_DIR ]

then
    echo "$SOURCE_DIR is exists:"
else
    echo "$SOURCE_DIR is does not exists:"
    exit 1
fi    