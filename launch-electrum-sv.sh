#!/bin/bash

docker run --rm -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.electrum-sv:/home/qtuser/.electrum-sv \
  -v ~/Downloads:/home/qtuser/Downloads \
  -e DISPLAY=$DISPLAY electrumsv
