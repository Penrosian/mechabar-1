#!/bin/sh
PP=$(powerprofilesctl get)
if [ "$1" = "d" ]; then
    if [ "$PP" = "performance" ]; then
        powerprofilesctl set balanced
    fi
    if [ "$PP" = "balanced" ]; then
        powerprofilesctl set power-saver
    fi
fi
if [ "$1" = "i" ]; then
    if [ "$PP" = "power-saver" ]; then
        powerprofilesctl set balanced
    fi
    if [ "$PP" = "balanced" ]; then
        powerprofilesctl set performance
    fi
fi
if [ "$1" = "g" ]; then
    if [ "$PP" = "power-saver" ]; then
        echo "🪴 Power Saver"
    fi
    if [ "$PP" = "balanced" ]; then
        echo "Balanced"
    fi
    if [ "$PP" = "performance" ]; then
        echo "🚀 Performance"
    fi
fi
