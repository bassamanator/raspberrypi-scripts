#!/bin/bash

for i in {1..10}; do
  sysbench cpu run --cpu-max-prime=10000 --num-threads=4
  echo "Iteration $i completed"
done
