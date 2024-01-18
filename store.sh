#! /bin/bash

problem=""

if [ $# -eq 0 ]; then
    read -p "Enter the problem: " problem
else
    problem=$1
fi

if [ -z "$problem" ]; then
    echo "nothing to do"
    exit 1
fi

problem=$(echo $problem | tr '[:upper:]' '[:lower:]')

# ABC
if [[ $problem =~ ^abc ]]; then
    problem=${problem:3}
    if [[ $problem =~ ^[0-9]{3} ]]; then
        num=${problem:0:3}
        id=${problem:3}
        if [ -z "$id" ]; then
            echo "problem id is empty"
            exit 1
        fi
        mkdir -p ./atcoder/ABC$num
        cp main.ua ./atcoder/ABC$num/$id.ua
    else
        echo "invalid problem number" $problem
        exit 1
    fi
fi
