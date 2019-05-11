#!/usr/bin/bash
for i in {0..255} ; do
    printf "\e[38;5;${i}mcolour %-5s\e[0m" $i
    if (( $i % 8 == 0 )) ; then printf "\n" ; fi
done
printf "\n"
