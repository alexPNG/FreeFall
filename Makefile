ARCHS = armv7 armv7s arm64 arm64e

TWEAK_NAME = FreeFall
FreeFall_FILES = Tweak.xm
FreeFall_FRAMEWORKS = CoreMotion AudioToolbox

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/FreeFall$(ECHO_END)
	$(ECHO_NOTHING)cp -r Resources/* $(THEOS_STAGING_DIR)/Library/FreeFall/$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += freefallprefs