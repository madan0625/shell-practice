#!/bin/bash

trap(){

    echo "error at $1:$2"
}
set -e

trap 'failure at "${LINENO}" "$BASH_COMMAND"' ERR

echo "hi hello"

echooooo "hello"

echo "hi"