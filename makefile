#
# makefile for r2d1.
#

ROOT	= $(PWD)


-include mk/*.config
-include mk/*.mk

usage:
	######################################################################
	# r2d1, my own modification for sgs.
	# edit mk/*.config for your own environtment.
	#
	# rules:
	# 	usage		this message
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


### misc rules
conn_r2d1:
	adb -s $(DEV_R2D1) shell

conn_maru:
	adb -s $(DEV_MARU) shell

