# Include common makefile
$(call inherit-product, device/samsung/u8500-common/common.mk)

LOCAL_PATH := device/samsung/janice

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# This device is HDPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Packages
PRODUCT_PACKAGES += \
    GalaxySAdvanceSettings

# RIL
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/manuf_id.cfg:/system/etc/AT/manuf_id.cfg \
   $(LOCAL_PATH)/configs/model_id.cfg:/system/etc/AT/model_id.cfg \
   $(LOCAL_PATH)/configs/system_id.cfg:/system/etc/AT/system_id.cfg

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/usr/keylayout/janice-kp.kl:system/usr/keylayout/janice-kp.kl \
    $(LOCAL_PATH)/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(LOCAL_PATH)/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl

# Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    $(LOCAL_PATH)/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    $(LOCAL_PATH)/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    $(LOCAL_PATH)/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    $(LOCAL_PATH)/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# Use non-open-source parts if present
$(call inherit-product-if-exists, vendor/samsung/janice/janice-vendor.mk)
