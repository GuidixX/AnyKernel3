### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=DragonIce
kernel.compiler=AOSP clang
kernel.made=GuidixX
message.word=
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=spes
device.name2=spesn
supported.versions=11.0-14.0
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes

# boot shell variables
block=boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# Print LOGO
ui_print "_______        ___         ___         ___         ___         ___       ";
ui_print "___/  /\      /  /\       /  /\       /  /\       /  /\       /__/\      ";
ui_print "__/  //\\    /  /  \     /  /  \     /  / /_     /  /  \      \  \ \     ";
ui_print "_/  //  \\  /  / /\ \   /  / /\ \   /  / / /\   /  / /\ \      \  \ \    ";
ui_print "/__// \__\|/  / / / /  /  / / /  \ /  / /_/  \ /  / /  \ \ _____\__\ \   ";
ui_print "_\  \\ /  //__/ / / /__/__/ / / /\ /__/ /__\/\ /__/ / \__\ /__/_______\  ";
ui_print "__\  \\  //\  \ \/ /   \  \ \/ /__\\  \ \ /  / \  \ \ /  / \  \ \__\_\/  ";
ui_print "___\  \\//  \  \  /     \  \  /     \  \ \  / / \  \ \  / / \  \ \       ";
ui_print "____\  \/    \  \ \      \  \ \      \  \ \/ /   \  \ \/ /   \  \ \      "; 
ui_print "_____\_/      \  \ \      \  \ \      \  \  /     \  \  /     \  \ \     ";
ui_print "_______________\__\/       \__\/       \__\/       \__\/       \__\/     ";
ui_print "___________________         ___                                          ";
ui_print "_______        /  /\       /  /\                                         ";
ui_print "___/  /\      /  / /      /  / /                                         ";
ui_print "__/  / /     /  / /      /  / / /\                                       ";
ui_print "_/__/  \    /  / /  ___ /  / / / /                                       ";
ui_print "_\__\/\ \__/__/ /  /  //__/ / / / /                                      ";
ui_print "__\  \ \/\  \ \ /  / \  \ \/ / / /                                       ";
ui_print "___\__\  /\  \ \  / / \  \  / / /                                        ";
ui_print "___/__/ /  \  \ \/ /   \  \ \/ /                                         ";
ui_print "___\__\/    \  \  /     \  \  /                                          ";
ui_print "_____________\__\/       \__\/                                         
sleep 1
ui_print "                               Directed by:                              ";
ui_print "                                 GuidixX                                 ";
# boot install
dump_boot; # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk

write_boot; # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
## end boot install


## init_boot files attributes
#init_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# init_boot shell variables
#block=init_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for init_boot patching
#reset_ak;

# init_boot install
#dump_boot; # unpack ramdisk since it is the new first stage init ramdisk where overlay.d must go

#write_boot;
## end init_boot install


## vendor_kernel_boot shell variables
#block=vendor_kernel_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_kernel_boot patching
#reset_ak;

# vendor_kernel_boot install
#split_boot; # skip unpack/repack ramdisk, e.g. for dtb on devices with hdr v4 and vendor_kernel_boot

#flash_boot;
## end vendor_kernel_boot install


## vendor_boot files attributes
#vendor_boot_attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# vendor_boot shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;

# vendor_boot install
#dump_boot; # use split_boot to skip ramdisk unpack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot

#write_boot; # use flash_boot to skip ramdisk repack, e.g. for dtb on devices with hdr v4 but no vendor_kernel_boot
## end vendor_boot install

