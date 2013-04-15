# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu.mk)

$(call inherit-product, device/lge/star-common/star.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p993/overlay

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/p993/p993-vendor.mk)

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/p993/init.p993.rc:root/init.star.rc \
    $(LOCAL_PATH)/ueventd.tegra.rc:root/ueventd.star.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/init.vsnet:system/bin/init.vsnet \
    $(LOCAL_PATH)/init.vsnet-down:system/bin/init.vsnet-down \
    $(LOCAL_PATH)/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

# Build kernel module instead of copying
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko

PRODUCT_PACKAGES += \
    lgcpversion

PRODUCT_NAME := full_p993
PRODUCT_DEVICE := p993
PRODUCT_MODEL := LG-P993
