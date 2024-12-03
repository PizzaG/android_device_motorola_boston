#!/system/bin/sh

# Set SeLinux Permissions
setenforce 0

mount /vendor_dlkm
mount /vendor
modprobe -d /vendor_dlkm/lib/modules /vendor_dlkm/lib/modules/goodix_brl_mmi.ko
modprobe -d /vendor_dlkm/lib/modules /vendor_dlkm/lib/modules/touchscreen_mmi.ko
sleep 1
if [ $(cat /sys/class/touchscreen/primary/productinfo) == "gt9916S" ]
then
echo 1 > /sys/class/touchscreen/primary/forcereflash
echo goodix-boe-gt9916S-24010501-6597AA91-avatrn.bin > /sys/class/touchscreen/primary/doreflash
echo "Reflashing Firmware..."
echo 0 > /sys/class/touchscreen/primary/forcereflash
fi

is_fastboot=$(getprop init.svc.fastbootd)
if [ "$is_fastboot" != "running" ]; then
    mount /vendor_dlkm
        insmod /vendor_dlkm/lib/modules/msm_drm.ko
        insmod /vendor_dlkm/lib/modules/mmi_annotate.ko
        insmod /vendor_dlkm/lib/modules/mmi_info.ko
        insmod /vendor_dlkm/lib/modules/mmi_relay.ko
        insmod /vendor_dlkm/lib/modules/mmi_charger.ko
        insmod /vendor_dlkm/lib/modules/mmi_sys_temp.ko
        insmod /vendor_dlkm/lib/modules/sensors_class.ko
        insmod /vendor_dlkm/lib/modules/touchscreen_mmi.ko
        insmod /vendor_dlkm/lib/modules/stmicro_mmi.ko
        insmod /vendor_dlkm/lib/modules/goodix_brl_mmi.ko
        insmod /vendor_dlkm/lib/modules/sx937x_sar.ko
        insmod /vendor_dlkm/lib/modules/bm_adsp_ulog.ko
        insmod /vendor_dlkm/lib/modules/qti_glink_charger.ko
        insmod /vendor_dlkm/lib/modules/qpnp_adaptive_charge.ko
        insmod /vendor_dlkm/lib/modules/q6_pdr_dlkm.ko
        insmod /vendor_dlkm/lib/modules/q6_notifier_dlkm.ko
        insmod /vendor_dlkm/lib/modules/snd_event_dlkm.ko
        insmod /vendor_dlkm/lib/modules/gpr_dlkm.ko
        insmod /vendor_dlkm/lib/modules/spf_core_dlkm.ko
        insmod /vendor_dlkm/lib/modules/adsp_loader_dlkm.ko
        insmod /vendor_dlkm/lib/modules/moto_f_mass_storage.ko
        insmod /vendor_dlkm/lib/modules/phy-msm-ssusb-qmp.ko
        insmod /vendor_dlkm/lib/modules/qdss_bridge.ko
        insmod /vendor_dlkm/lib/modules/ssusb-redriver-ps5169.ko
        insmod /vendor_dlkm/lib/modules/usb_f_qdss.ko
        insmod /vendor_dlkm/lib/modules/moto_f_usbnet.ko
fi

mkdir /firmware
SLOT=$(getprop ro.boot.slot_suffix)
mount /dev/block/bootdevice/by-name/modem$SLOT /firmware -O ro
echo "1" > /proc/sys/kernel/firmware_config/force_sysfs_fallback
echo "1" > /sys/kernel/boot_adsp/boot
exit 0
