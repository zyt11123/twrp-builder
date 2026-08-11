#
# Copyright (C) 2024 TeamWin Recovery Project
#
# Android.mk for Realme GT Neo (RMX3031)
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),realme_gt_neo)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
