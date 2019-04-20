#!/bin/bash
# This script fills the unicodes.md file in this dir with matching unicode
# icons in the system. They are copy-pasteable to other .ini files.
# 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE=$DIR/unicodes.md
TMPFILE=$(mktemp /tmp/dotfiles.unicode.XXXXXX)

while IFS= read -r line
do
    if [[ $line == -* ]] ; then
        CODE=${line:2:4}
        PRE=$(echo $line | cut -d'|' -f1)
        POST=$(echo $line | cut -d'|' -f3)

        if [[ $CODE == "xxxx" ]]; then
            echo -e "$PRE| \uf11a |$POST"
        else
            echo -e "$PRE| \u$CODE |$POST"
        fi
    else
        echo "$line"
    fi
done < "$FILE" >"$TMPFILE"
mv "$TMPFILE" "$FILE"