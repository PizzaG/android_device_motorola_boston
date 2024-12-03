#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_boston.mk

COMMON_LUNCH_CHOICES := \
    twrp_boston-user \
    twrp_boston-userdebug \
    twrp_boston-eng
