#!/bin/sh
# Uses xwinwrap to display given animated .gif in the center of the screen

if [ $# -ne 1 ]; then
    echo 1>&2 "Usage: ${0} image.gif"
    exit 1
fi

#get screen resolution
SCRH=$(xrandr | awk '/current/ { print $8 }')
SCRW=$(xrandr | awk '/current/ { print $10 }')
SCRW=${SCRW%\,}

#get gif resolution
IMGHW=$(gifsicle --info "$1" | awk '/logical/ { print $3 }')
IMGH=${IMGHW%x*}
IMGW=${IMGHW#*x}

#calculate position
POSH=$((($SCRH/2)-($IMGH/2)))
POSW=$((($SCRW/2)-($IMGW/2)))


# nice -n 15: Set very low CPU priority for this process.
# -ni  : Ignore Input
# -s   : Sticky
# -nf  : No Focus
# -b   : Below
# -un  : Undecorated
# -argb: RGB
# -sh  : Shape of window (choose between rectangle, circle or triangle. Default is rectangle)
# -ov  : Set override_redirect flag (For seamless desktop background integration in non-fullscreenmode)
nice -n 15 xwinwrap -g ${IMGHW}+${POSH}+${POSW} -ni -s -nf -b -un -argb -- gifview -w WID $1 -a
#echo "running: xwinwrap -g ${IMGHW}+${POSH}+${POSW} -ov -ni -s -nf -b -un -argb -sh circle -- gifview -w WID $1 -a"
exit 0
