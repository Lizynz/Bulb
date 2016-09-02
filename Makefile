ARCHS = armv7 armv7s arm64
DEBUG = 0
TARGET = iphone:clang:latest:9.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Bulb
Bulb_FILES = Tweak.xm
Bulb_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 SpringBoard"
