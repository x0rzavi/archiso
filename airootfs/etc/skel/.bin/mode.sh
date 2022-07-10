#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Optimize for performance
# Dependencies: amdctl, ryzenadj

# MODEL: hp 15s-gr0009au
# PROCHOT: 80C

performance () {
    ryzenadj --stapm-limit=25000 --fast-limit=30000 --slow-limit=25000 --tctl-temp=77 \
    		--vrm-current=45000 --vrmmax-current=55000 --max-performance --slow-time=75 \
    		--stapm-time=10
    amdctl -p0 -v124
    amdctl -p1 -v96 -f102   #Default
    amdctl -p2 -v102 -f98   #Default
}

battery () {
    ryzenadj --stapm-limit=15000 --fast-limit=15000 --slow-limit=15000 --tctl-temp=60
    amdctl -p1 -v104 -f86
    amdctl -p2 -v120 -f60
}

default () {
    ryzenadj --stapm-limit=15000 --fast-limit=25000 --slow-limit=20000 --tctl-temp=89 \
    		--vrm-current=35000 --vrmmax-current=45000 --slow-time=5 --stapm-time=200
    amdctl -p0 -v53
    amdctl -p1 -v96 -f102
    amdctl -p2 -v102 -f98
}

undervolt () {
    amdctl -p0 -v124
}

info () {
    echo -e "################### INFO FROM RYZENADJ ###################\n"
    ryzenadj -i
    echo -e "\n################## INFO FROM AMDCTL ###################\n"
    amdctl -g
}

show_help () {
	cat <<EOF

Usage: mode.sh [options]
AVAILABLE OPTIONS:
  --batt        optimizations for battery saving
  --perf        optimizations for performance
  --uv		only undervolt p0 state
  --def         reset configurations to default
  --info        report info
EOF
}

if [ "$UID" -eq "0" ]; then
    if [[ "$1" == "--batt" ]]; then
    	battery
    elif [[ "$1" == "--perf" ]]; then
    	performance
    elif [[ "$1" == "--uv" ]]; then
        undervolt
    elif [[ "$1" == "--def" ]]; then
    	default
    elif [[ "$1" == "--info" ]]; then
    	info
    else
    	show_help
    fi
else
    echo "Root privileges are required!"
fi
