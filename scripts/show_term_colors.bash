#!/bin/bash
# Description:
#  Display available terminal colors. Can be used to set the prompt, for example.
#
# Usage:
#   bash show_term_colors.bash

# Show different colors.
color=16;
while [ $color -lt 245 ]; do
    echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
    ((color++));
done

# Build specific RGB color
function RGBColor {
    echo "16 + $1 * 36 + $2 * 6 + $3" | bc
}
fg=$(RGBColor 1 0 2)  # Violet
bg=$(RGBColor 5 3 0)  # Bright orange.
echo -e "\\033[1;38;5;$fg;48;5;${bg}mviolet on tangerine\\033[0m"
