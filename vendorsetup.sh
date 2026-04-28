#!/bin/bash

KERNEL_PATH="kernel/xiaomi/lahaina"



base64 -d device/xiaomi/lisa/configs/camera/secret > device/xiaomi/lisa/configs/camera/st_license.lic

# Kernel
git clone -b uvite https://github.com/paranoid-lisa/kernel_xiaomi_lahaina.git $KERNEL_PATH

# KernelSU-Next
cd $KERNEL_PATH &&
git submodule update --init --recursive
&&
cd

# Vendor
git clone -b uvite https://github.com/paranoid-lisa/vendor_xiaomi_lisa.git vendor/xiaomi/lisa

# Firmware
git clone -b uvite https://github.com/paranoid-lisa/vendor_xiaomi_firmware.git vendor/xiaomi/firmware

# Hardware
git clone -b XiaomiDolby-aospa https://github.com/paranoid-lisa/hardware_dolby.git hardware/dolby
