#!/bin/sh
#nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
while true; do

	gputemp=$(nvidia-settings -q GPUCoreTemp |awk -F ":" 'NR==2{print $3}' |sed 's/[^0-9]*//g')

case "${gputemp}" in

    0[0-9])
            newfanspeed="0"
            ;;
    1[0-9])
            newfanspeed="0"
            ;;
    2[0-9])
            newfanspeed="0"
            ;;
    3[0-9])
            newfanspeed="0"
            ;;
    4[0-9])
            newfanspeed="10"
            ;;
    5[0-4])
            newfanspeed="20"
            ;;
    5[5-6])
            newfanspeed="30"
            ;;
    5[7-9])
            newfanspeed="40"
            ;;
    6[0-5])
            newfanspeed="50"
            ;;
    6[6-9])
            newfanspeed="60"
            ;;
    7[0-5])
            newfanspeed="70"
            ;;
    7[6-9])
            newfanspeed="80"
            ;;
    *)
            newfanspeed="100"
            ;;
esac

nvidia-settings -a "[fan-0]/GPUTargetFanSpeed=${newfanspeed}" 2>&1 >/dev/null

sleep 30s

done
