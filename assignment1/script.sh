#!/bin/bash

if [ $# == 0 ]; then
    echo "file path missing!"
    exit 1
elif [ $# == 1 ]; then
    cd $1
    # cd fs15_teamwork
    git shortlog -sn --all > ../output.txt
    exit 0
else
    cd $1
    > ../output.txt
    for name in "${@:2}"; do
        git shortlog -sn --all | grep -i "$name" | awk '{print $1, "- ", $2, $3, $4}' >> ../output.txt
        echo $name
    done
    exit 0
fi

# example commmand:
# ./script.sh --> should echo "file path missing"
# ./script.sh fs15_teamwork --> should print out all contributions per contributor
# ./script.sh fs15_teamwork khanh alia --> should print out only contributions from found authors

