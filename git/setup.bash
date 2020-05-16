#!/bin/bash
#
# bash ~/.dotfiles/git/setup.bash
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "========================"
echo "Setting up git"
echo "========================"

echo "> Update local gitconfig for dotfiles"
bash "${DIR}"/config_local.bash
echo ""

echo "> Add symlink: ~/.local/bin/format_branch_files.sh"
ln -sf "${DIR}"/format_branch_files.sh "${HOME}"/.local/bin/
echo ""

echo "> Update general ~/.gitconfig"
NEW_CONFIG="${DIR}"/gitconfig
DST_CONFIG=~/.gitconfig
if [ -f "${DST_CONFIG}" ]; then
    if ! cmp --silent "${DST_CONFIG}" "${NEW_CONFIG}"; then
	DATETIME="$(date +%Y-%m-%d_%H-%M-%S)"
	BACKUP_CONFIG="${DST_CONFIG}.${DATETIME}.bkp"
	echo " - A different config already exists, backing up: ${BACKUP_CONFIG}"
	cp -f "${DST_CONFIG}" "${BACKUP_CONFIG}"
    fi
fi
echo " - Copying template config: ${NEW_CONFIG} into ${DST_CONFIG}"
cp -f "${NEW_CONFIG}" "${DST_CONFIG}"

