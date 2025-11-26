#!/usr/bin/env bash
LIGHT=0

while true; do
  BATTERY_LEVEL=$(headsetcontrol -cb 2>/dev/null)

  if [ -n "$BATTERY_LEVEL" ] && [ "$BATTERY_LEVEL" -gt 0 ] && [ "$LIGHT" -eq 0 ]; then
    headsetcontrol -cl0 2>/dev/null
    LIGHT=1
  elif [ -n "$BATTERY_LEVEL" ] && [ "$BATTERY_LEVEL" -lt 0 ] && [ "$LIGHT" -eq 1 ]; then
    LIGHT=0
  fi
  sleep 2
done
