# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lime
device.name2=citrus
device.name3=chime
device.name4=juice
device.name5=
supported.versions=11-14
supported.patchlevels=
'; } # end properties

# shell variables
if [ -e /dev/block/platform/13520000.ufs/by-name/BOOT ]; then
	block=/dev/block/platform/13520000.ufs/by-name/BOOT;
fi
block=/dev/block/bootdevice/by-name/boot
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
#Method 1:
#dump_boot;
#write_boot;

#Method 2:
split_boot;
ui_print "- Installing IKyz Kernel";
flash_boot;

ui_print "- Installation finished successfully";
ui_print " ";

#ui_print "- Thank you for using ashcafe Kernel :)";
#ui_print " ";

## end install

