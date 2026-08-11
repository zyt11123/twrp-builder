#
# Copyright (C) 2024 TeamWin Recovery Project
#
# Device Makefile for Realme GT Neo (RMX3031)
#

# Device identifier
PRODUCT_NAME := omni_realme_gt_neo
PRODUCT_DEVICE := realme_gt_neo
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3031
PRODUCT_MANUFACTURER := realme

# Inherit from common TWRP configuration (if available)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# If vendor/twrp not available, define minimal TWRP config
ifeq ($(wildcard vendor/twrp/config/common.mk),)
# TWRP minimal flags
DEVICE_RESOLUTION := 1080x2400
TW_THEME := portrait_hdpi
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 600
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone1/temp
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_USE_TOOLBOX := true
TW_HAS_EDL_MODE := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_FRAMERATE := 60
TW_STATUS_ICONS_ALIGN := center
TW_SUPPORT_INPUT_AIDL_HAPTICS := true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true
endif

# Device-specific properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.name=RMX3031 \
    ro.product.model=RMX3031 \
    ro.product.brand=realme \
    ro.product.device=RMX3031 \
    ro.product.manufacturer=realme \
    ro.build.product=RMX3031 \
    ro.build.description=RMX3031-user 13 TP1A.220624.014 release-keys \
    ro.build.fingerprint=realme/RMX3031/RE54ABL1:13/TP1A.220624.014/root:user/release-keys

# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# Dalvik/ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# Health (required for recovery)
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Call the proprietary setup (optional)
$(call inherit-product-if-exists, vendor/realme/realme_gt_neo/realme_gt_neo-vendor.mk)
