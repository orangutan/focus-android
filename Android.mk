LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := firefoxKlar
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := firefoxKlar

ff_root  := $(LOCAL_PATH)
ff_dir   := app
ff_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
ff_build := $(ff_root)/$(ff_dir)/build
ff_apk   := build/outputs/apk/klarArm/release/$(ff_dir)-klar-arm-release-unsigned.apk

#./app/build/outputs/apk/klarArm/release/app-klar-arm-release-unsigned.apk

$(ff_root)/$(ff_dir)/$(ff_apk):
	rm -Rf $(ff_build)
	mkdir -p $(ff_out)
	ln -sf $(ff_out) $(ff_build)
	cd $(ff_root)/$(ff_dir) && ../gradlew clean assembleKlarArmRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(ff_dir)/$(ff_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
