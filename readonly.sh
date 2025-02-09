#!/bin/bash

# VAR1="madan"

# readonly VAR1             # when you mentaion readonly before variable_name, it can't be changed by anyone

# VAR1="kumar"              # it will prevent unwantedly over writing    

VAR1="madan"

readonly VAR1

echo "readonly name : $VAR1"