#!/bin/bash

# --- 入力チェック ---
if [ $# -ne 2 ]; then
    echo "Error: 引数は2つの自然数である必要があります。" >&2
    exit 1
fi

# 数値チェック（自然数のみ許可）
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
    echo "Error: 引数は自然数である必要があります。" >&2
    exit 1
fi

a=$1
b=$2

# --- ユークリッドの互除法 ---
while [ $b -ne 0 ]; do
    temp=$b
    b=$(( a % b ))
    a=$temp
done

echo $a
exit 0

