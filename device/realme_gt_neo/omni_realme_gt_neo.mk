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

# Inherit from common TWRP configuration
$(call inherit-product, vendor/twrp/config/common.mk)

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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.mt6893

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.mt6893

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.mt6893

# VNDK
PRODUCT_PACKAGES += \
    vndk_package

# Call the proprietary setup
$(call inherit-product, vendor/realme/realme_gt_neo/realme_gt_neo-vendor.mk)
