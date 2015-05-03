include theos/makefiles/common.mk

APPLICATION_NAME = WifiNetworkList
WifiNetworkList_FILES = main.m WifiNetworkListApplication.mm RootViewController.mm AADictionaryViewController.m
WifiNetworkList_FRAMEWORKS = UIKit CoreGraphics
WifiNetworkList_PRIVATE_FRAMEWORKS = MobileWiFi
WifiNetworkList_CODESIGN_FLAGS = -Sentitlements.xml


IPHONE_ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall -9 WifiNetworkList"
