#! /bin/bash

# path of oj
oj_path="./venv/bin/oj"

problem=$1

# get problem id
if [ -z $problem ]; then
    read -p "Enter the problem: " problem
fi

rm -rf ./test

# testcases
$oj_path download https://atcoder.jp/contests/${problem:0:6}/tasks/${problem:0:6}_${problem:6:1}

$oj_path test -c "uiua main.ua"

if [ $? -eq 0 ]; then
    # if store is not y or n, ask again
    $store=""
    while [ "$store" != "y" ] && [ "$store" != "n" ]; do
        read -p "Congrats! Do you want to store the code? [Y/n]: " store
        if [ -z $store ]; then
            store="y"
        fi
        if [ $store = "y" ]; then
            ./store.sh $problem
            echo "Code stored!"
        fi
    done
fi
