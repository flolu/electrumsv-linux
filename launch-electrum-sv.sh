#!/bin/bash

if [[ $XDG_SESSION_TYPE == "wayland" ]]
then
  echo "Wayland session detected."
  docker run --rm -it \
    -e XDG_RUNTIME_DIR=/tmp \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e QT_QPA_PLATFORM=wayland \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY  \
    -v ~/.electrum-sv:/home/qtuser/.electrum-sv \
    -v ~/Downloads:/home/qtuser/Downloads \
    --user=$(id -u):$(id -g) \
    electrumsv-1.3.16
elif [[ $XDG_SESSION_TYPE == "x11" ]]
then
  echo "X11 session detected."
  docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.electrum-sv:/home/qtuser/.electrum-sv \
    -v ~/Downloads:/home/qtuser/Downloads \
    -e DISPLAY=$DISPLAY \
    electrumsv-1.3.16
elif [[ $XDG_SESSION_TYPE == "tty" ]]
then
  echo "TTY session detected. Using Wayland configuration..."
  docker run --rm -it \
    -e XDG_RUNTIME_DIR=/tmp \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e QT_QPA_PLATFORM=wayland \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY  \
    -v ~/.electrum-sv:/home/qtuser/.electrum-sv \
    -v ~/Downloads:/home/qtuser/Downloads \
    --user=$(id -u):$(id -g) \
    electrumsv-1.3.16
else
  echo "Unknown session type: $XDG_SESSION_TYPE. Trying to launch using X11 configuration..."
  docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.electrum-sv:/home/qtuser/.electrum-sv \
    -v ~/Downloads:/home/qtuser/Downloads \
    -e DISPLAY=$DISPLAY \
    electrumsv-1.3.16
fi
