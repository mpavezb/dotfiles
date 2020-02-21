#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "== rxvt unicode setup === "

echo " - Creating ~/.Xresources.d/"
mkdir -p ~/.Xresources.d/

echo " - Linking ~/.Xresources.d/rxvt-unicode to ${DIR}/Xresources"
rm -f ~/.Xresources.d/rxvt-unicode
ln -s "${DIR}/Xresources" ~/.Xresources.d/rxvt-unicode

echo " - Checking ~/.Xresources"
touch ~/.Xresources
if  ! grep -q "#include \".Xresources.d/rxvt-unicode\"" ~/.Xresources; then
    echo '#include ".Xresources.d/rxvt-unicode"' >> ~/.Xresources

    echo ""
    echo "Updating ~/.Xresources:"
    cat ~/.Xresources
    echo ""
fi

echo " - Reloading ~/.Xresources.d/rxvt-unicode"
xrdb ~/.Xresources.d/rxvt-unicode

