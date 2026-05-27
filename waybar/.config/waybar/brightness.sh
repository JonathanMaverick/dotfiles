#!/bin/bash

BUS=18
STEP=5

get() {
  internal=$(brightnessctl | grep -Po '(?<=\()\d+(?=%\))' | head -1)
  echo "${internal:-0}%"
}

sync_external() {
  internal=$(brightnessctl | grep -Po '(?<=\()\d+(?=%\))' | head -1)
  [[ -z "$internal" ]] && internal=0
  ddcutil setvcp 10 $internal --bus=$BUS >/dev/null 2>&1
}

inc() {
  brightnessctl set +${STEP}% >/dev/null
  sync_external
}

dec() {
  brightnessctl set ${STEP}%- >/dev/null
  sync_external
}

case "$1" in
up) inc ;;
down) dec ;;
*) get ;;
esac
