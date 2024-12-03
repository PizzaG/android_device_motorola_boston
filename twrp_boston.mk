#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from avatrn device
$(call inherit-product, device/motorola/boston/device.mk)

PRODUCT_DEVICE := boston
PRODUCT_NAME := twrp_boston
PRODUCT_BRAND := Moto_G
PRODUCT_MODEL := XT2419
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := Moto G Sylus 5G 2024

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="boston-user 12 U2UBS34.44-57-6 c77dd4 release-keys"

BUILD_FINGERPRINT := motorola/boston/boston:12/U2UBS34.44-57-6/c77dd4:user/release-keys
