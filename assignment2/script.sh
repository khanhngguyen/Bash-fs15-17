#!/bin/bash

if [ $# == 0 ]; then
    echo "please provide component name(s) as argument"
    exit 1
else 
    cd ./fs15_frontend-project/src
    for component in "${@:1}"; do
        count=$(grep -iwroh "<$component" . | wc -w)
        echo $component - $count
    done
    exit 0
fi

# example
# ./script.sh --> should echo "please provide component name(s) as argument"
# ./script.sh Grid Paper --> should echo component name with its count of use