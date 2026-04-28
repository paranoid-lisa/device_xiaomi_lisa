#!/bin/bash

base64 -d device/xiaomi/lisa/configs/camera/secret > device/xiaomi/lisa/configs/camera/st_license.lic

# Hardware
git clone -b XiaomiDolby-aospa https://github.com/paranoid-lisa/hardware_dolby.git hardware/dolby
