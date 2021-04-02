#!/bin/sh
sudo killall touchegg
touchegg --daemon &
sleep 2s
touchegg --client &
