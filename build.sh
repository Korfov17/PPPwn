#!/bin/bash

# Check if the firmware version is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <FW>"
  exit 1
fi

FW=$1

make -C stage2 FW=$FW clean
make -C stage2 FW=$FW USB_LOADER=1

# Add period before the last two digits
FW_WITH_PERIOD="${FW:0:${#FW}-2}.${FW:${#FW}-2}"
cp PPPwn/stage2/stage2.bin "stage2_$FW_WITH_PERIOD.bin"
