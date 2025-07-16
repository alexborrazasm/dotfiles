#!/bin/bash

# Detect conected screens
CONNECTED=$(hyprctl monitors all | grep 'Monitor' | awk '{print $2}' | sort)

# Screens
LAPTOP="eDP-2"
EXT1="HDMI-A-1"
EXT2="DP-3"

if echo "$CONNECTED" | grep -q "$EXT1" && echo "$CONNECTED" | grep -q "$EXT2"; then
    # Only extern
    hyprctl keyword monitor "$LAPTOP,disable"
    hyprctl keyword monitor "$EXT1,1920x1080@60,0x0,1"
    hyprctl keyword monitor "$EXT2,1920x1080@60,1920x0,1"
elif echo "$CONNECTED" | grep -q "$EXT1"; then
    # Only DP-3 and laptop
    hyprctl keyword monitor "$EXT1,1920x1080@60,0x0,1"
    hyprctl keyword monitor "$LAPTOP,2560x1600@120,1920x0,1.6"
    hyprctl keyword monitor "$EXT2,disable"
elif echo "$CONNECTED" | grep -q "$EXT2"; then
    # Only HDMI-A-1 and laptop
    hyprctl keyword monitor "$EXT2,1920x1080@60,0x0,1"
    hyprctl keyword monitor "$LAPTOP,2560x1600@120,1920x0,1.6"
    hyprctl keyword monitor "$EXT1,disable"
else
    # Only laptop and laptop
    hyprctl keyword monitor "$LAPTOP,2560x1600@120,0x0,1.6"
    hyprctl keyword monitor "$EXT1,disable"
    hyprctl keyword monitor "$EXT2,disable"
fi

