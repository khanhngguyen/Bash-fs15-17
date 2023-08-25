#!/bin/bash

if [ $# == 0 ]; then
    echo "please provide name (or names) of country as argument(s)"
    exit 1
else
    > ./output.txt
    for country in "${@:1}"; do
        country=${country// /%20}
        details=$(curl "https://restcountries.com/v3.1/name/$country" | jq .[0])
        name=$(jq -r '.name.common' <<< $details)
        capital=$(jq -r '.capital | join(", ")' <<< $details)
        population=$(jq -r '.population' <<< $details)
        languages=$(jq -r '.languages | join(", ")' <<< $details)
        echo "Name: $name" >> output.txt
        echo "Capital: $capital" >> output.txt
        echo "Population: $population" >> output.txt
        echo "Languages: $languages" >> output.txt
        echo " " >> output.txt
    done
    exit 0
fi

# example
# ./script --> should echo "please provide name (or names) of country as argument(s)"
# ./country.sh finland vietnam --> should print out information for each country
# ./country.sh "finland" "vietnam" "south africa" --> if country name has multiple words, put name in double quotes
