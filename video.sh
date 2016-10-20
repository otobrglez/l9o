#!/usr/bin/env bash

ffmpeg -framerate 1/5  \
  -start_number 0 \
  -i ./frames/%02d-%.html.png \
  -vcodec mpeg4 \
  out.avi
