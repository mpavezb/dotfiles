#!/bin/bash
#
# Usage:
#   export DOTFILES=~/.dotfiles
#   bash ${DOTFILES}/git/setup.bash
#

echo "> Update local gitconfig for dotfiles"
cd "${DOTFILES}"
bash "${DOTFILES}/scripts/set_local_gitconfig.bash"

echo "> Update general ~/.gitconfig"
NEW_CONFIG="${DOTFILES}"/git/gitconfig
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
