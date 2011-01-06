#
# makefile for r2d1.
#

ROOT		= $(PWD)
BK_USERAPPS	= backup.userapps
BK_SDPULL	= backup.sdcard


-include mk/*.config
-include mk/*.mk

usage:
	######################################################################
	# r2d1, my own modification for sgs.
	# edit mk/*.config for your own environtment.
	#
	# rules:
	# 	usage		show this message.
	# 	conn_r2d1	connect to device via adb shell.
	# 	bk_user_apps	backup archived apps from device. (by qsi)
	# 	sync_sd_r2d1	sync contents from mounted sdcard.
	# 	pull_sd_r2d1	backup sdcard contents via adb pull.
	#
	@make env

env:
	######################################################################
	# build environment:
	#
	# HOME		$(HOME)
	# ROOT		$(ROOT)
	# DEV_R2D1	$(DEV_R2D1)
	# DEV_MARU	$(DEV_MARU)
	#



### for custom bootanimation
bootani_build:
	cd bootanimation; ./bootanimation.sh build

bootani_push:
	cd bootanimation; ./bootanimation.sh push

### misc management rules
conn_r2d1:
	adb -s $(DEV_R2D1) shell

conn_maru:
	adb -s $(DEV_MARU) shell

bk_user_apps:
	### pull archived apps from both devices.
	mkdir -p $(BK_USERAPPS)
	-adb -s $(DEV_MARU) pull /sdcard/backups/user $(BK_USERAPPS)/
	-adb -s $(DEV_R2D1) pull /sdcard/backups/user $(BK_USERAPPS)/
	for i in $(BK_USERAPPS)/*.apk; do appinfo.sh "$$i"; done

sync_sd_r2d1:
	### sync contents from mounted sdcard of r2d1.

pull_sd_r2d1:
	### pull internal sdcard contents into $(BK_SDPULL)/r2d1/...
	mkdir -p $(BK_SDPULL)/r2d1/
	adb -s $(DEV_R2D1) pull /sdcard/ $(BK_SDPULL)/r2d1/

pull_sd_maru:
	### pull internal sdcard contents into $(BK_SDPULL)/maru/...
	mkdir -p $(BK_SDPULL)/maru/
	adb -s $(DEV_MARU) pull /sdcard/ $(BK_SDPULL)/maru/


