#!/bin/bash

# テスト失敗時に即終了
set -e

# --- テスト関数 ---
test_case() {
    input1=$1
    input2=$2
    expected=$3

    output=$(./gcd.sh "$input1" "$input2" 2>/dev/null)

    if [ "$output" = "$expected" ]; then
        echo "OK: gcd($input1, $input2) = $expected"
    else
        echo "NG: gcd($input1, $input2) → $output（期待値: $expected）"
        exit 1
    fi
}

# --- 正常系テスト ---
test_case 2 4 2
test_case 12 18 6
test_case 100 80 20
test_case 7 13 1

# --- 異常系テスト ---
# 引数不足
if ./gcd.sh 3 >/dev/null 2>&1; then
    echo "NG: 引数不足でエラーにならない"
    exit 1
else
    echo "OK: 引数不足でエラー"
fi

# 文字列入力
if ./gcd.sh a b >/dev/null 2>&1; then
    echo "NG: 文字列入力でエラーにならない"
    exit 1
else
    echo "OK: 文字列入力でエラー"
fi

echo "すべてのテストが成功しました"
exit 0

