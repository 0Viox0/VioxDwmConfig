#!/bin/bash

minBrightness=12000
currentBrightness=$(brightnessctl g)
arguments=$@
operation="${arguments: -1}"

futureBrightness=$currentBrightness

if [[ "$operation" == "-" ]]; then
	futureBrightness=$(echo "$currentBrightness - 0.1 * 120000" | bc)
fi

if (( $(echo "$futureBrightness < $minBrightness" | bc -l) )); then
	brightnessctl s $minBrightness
else
	brightnessctl "$@"
fi
