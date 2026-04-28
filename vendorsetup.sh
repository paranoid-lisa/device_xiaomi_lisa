#!/bin/bash

set -e

KERNEL_PATH="kernel/xiaomi/lahaina"

clone_if_not_exist() {
    local repo_url=$1
    local branch=$2
    local dest=$3

    if [ -d "$dest" ]; then
        echo "✔ Skipping $dest (already exists)"
    else
        echo "⬇ Cloning $dest"
        git clone -b "$branch" "$repo_url" "$dest"
    fi
}

# Decode camera license (always run)
base64 -d device/xiaomi/lisa/configs/camera/secret > device/xiaomi/lisa/configs/camera/st_license.lic

# Kernel
clone_if_not_exist https://github.com/paranoid-lisa/kernel_xiaomi_lahaina.git uvite $KERNEL_PATH

# KernelSU-Next (submodules)
if [ -d "$KERNEL_PATH" ]; then
    cd $KERNEL_PATH
    git submodule update --init --recursive
    cd -
fi

# Vendor
clone_if_not_exist https://github.com/paranoid-lisa/vendor_xiaomi_lisa.git uvite vendor/xiaomi/lisa

# Firmware
clone_if_not_exist https://github.com/paranoid-lisa/vendor_xiaomi_firmware.git uvite vendor/xiaomi/firmware

# Hardware (Dolby)
clone_if_not_exist https://github.com/paranoid-lisa/hardware_dolby.git XiaomiDolby-aospa hardware/dolby
