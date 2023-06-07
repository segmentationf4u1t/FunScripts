#!/bin/bash

get() {
  local length=$1
  local chars=( {a..z} {A..Z} {0..9} )
  local max=${#chars[@]}
  for ((i=0; i<length; i++)); do
    echo -n "${chars[RANDOM % max]}"
  done
}

gen_key() {
  for ((i=1; i<=10; i++)); do
    local keys=$((RANDOM % 85 + 20))
    echo "[Page $i] found keys: $keys"
    local unique=$((RANDOM % keys))
    echo "unique keys: $unique"
    for ((d=0; d<unique; d++)); do
      if (( RANDOM % 30 == 1 )); then
        balance=$(awk -v val=$RANDOM 'BEGIN {print (val % 50000 - 1000) / 100}')
        echo "gpt-4 sk-$(get 49) balance: $balance"
      fi
    done
  done
}

echo "Finding keys"
echo "------------"
echo "using Google engine"
for (( j=0; j<3; j++ )); do
  echo "[$j] searching *****"
  gen_key
done
echo "using Bing engine"
for (( j=0; j<5; j++ )); do
  echo "[$j] searching *****"
  gen_key
done
