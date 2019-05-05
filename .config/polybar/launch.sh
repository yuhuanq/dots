#! /bin/sh
#
# launch.sh
# Copyright (C) 2017 yqiu <yqiu@f24-suntzu>
#
# Distributed under terms of the MIT license.
#


# terminate already running bar instances
killall -q polybar

# wait until processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar top &

echo "bars launched..."

