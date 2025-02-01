#!/bin/env sh

# Set repository and archive prefix
REPO="/home/kayc/.backup/backup-arch-kayc"
ARCHIVE_PREFIX="1671bc-$(date +'%Y-%m-%d_%H-%M')"

EXCLUDES=(
    --exclude '/home/kayc/.ViberPC'
    --exclude '/home/kayc/.dotfiles'
    --exclude '/home/kayc/.backup'
    --exclude '/home/kayc/.vscode'
    --exclude '/home/kayc/.vscode-root'
    --exclude '/home/kayc/Code'
    --exclude '/home/kayc/Misc'
    --exclude '/home/kayc/Downloads'
    --exclude '/home/kayc/.cache'
    --exclude '/home/kayc/.gradle'
    --exclude '/home/kayc/FlatpakApps'
    --exclude '/home/kayc/.lmstudio'
    --exclude '*/waydroid'
    --exclude '*/uv'
    --exclude '*/.docker'
    --exclude '*/Steam'

)

borg create --exclude-caches "${REPO}::${ARCHIVE_PREFIX}" /home/kayc "${EXCLUDES[@]}"
borg prune -v --list "${REPO}" --keep-hourly 2 --keep-daily 1 --keep-weekly 0 --keep-monthly 0 --keep-yearly 0
