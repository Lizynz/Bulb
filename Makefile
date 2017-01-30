export ARCHS = armv7 armv7s arm64
DEBUG = 0
export TARGET = iphone:clang:9.3

//export SDKVERSION = 9.3
export SYSROOT = $(THEOS)/sdks/iPhoneOS9.3.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Bulb
Bulb_FILES = Tweak.xm
Bulb_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
