#!/usr/bin/env bash

# outputs the two parts in reverse order

tr FBLR 0101 <input | sort | {
    while read n
    do
        n=$((2#$n))
        (( prev+2 == n )) && echo $((prev+1))
        prev=$n
    done
    echo $prev
}
