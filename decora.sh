#!/usr/bin/env bash

#--转圈圈;
__waiting() {
    i=0
    while [ $i -le 100000000 ]
    do
        for j in '\\' '|' '/' '-'
        do
            #tput sc
            printf "${Green}   %c%c%c%c%c ${Purple}HOLD ON${Green} %c%c%c%c%c\r" "$j" "$j" "$j" "$j" "$j" "$j" "$j" "$j" "$j" "$j${Cls}"
            #tput rc ;tput ed
            sleep 0.05
        done
        ((i+=4))
    done
}
