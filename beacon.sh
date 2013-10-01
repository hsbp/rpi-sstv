#!/bin/sh
python /home/pi/beacon.py | /home/pi/unixsstv/gen_values 44100 >/tmp/wav.bin
play -q -r 44100 -t f32 -c 1 --norm /tmp/wav.bin >/dev/null 2>&1
python -c 'import RPi.GPIO as G; G.setmode(G.BCM); G.setup(18, G.OUT); G.output(18, False); G.cleanup()' >/dev/null 2>&1
rm -f /tmp/wav.bin
