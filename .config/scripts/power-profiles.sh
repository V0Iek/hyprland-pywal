#!/bin/sh

case $(powerprofilesctl get) in
  "performance") powerprofilesctl set power-saver
  ;;
  "balanced") powerprofilesctl set performance
  ;;
  "power-saver") powerprofilesctl set balanced
  ;;
esac
