#!/bin/bash

set -e

KERNEL_PATH="kernel/xiaomi/lahaina"

clone_if_not_exist() {
    repo_url="$1"
    branch="$2"
    dest="$3"

    if [ -d "$dest" ]; then
        echo "✔ Skipping $dest (already exists)"
    else
        echo "⬇ Cloning $dest"
        git clone -b "$branch" "$repo_url" "$dest"
    fi
}

# Decode camera license
base64 -d device/xiaomi/lisa/configs/camera/secret > device/xiaomi/lisa/configs/camera/st_license.lic

# KernelSU-Next (submodules)
if [ -d "$KERNEL_PATH" ]; then
    cd "$KERNEL_PATH"
    git submodule update --init --recursive
    cd -
fi

# Hardware (Dolby)
clone_if_not_exist "https://github.com/paranoid-lisa/hardware_dolby.git" "XiaomiDolby-aospa" "hardware/dolby"
