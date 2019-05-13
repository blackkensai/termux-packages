#!/bin/sh
set -e -u

# Install desired parts of the Android SDK:
. $(cd "$(dirname "$0")"; pwd)/properties.sh

ANDROID_SDK_FILE=sdk-tools-linux-4333796.zip
ANDROID_SDK_SHA256=92ffee5a1d98d856634e8b71132e8a95d96c83a63fde1099be3d86df3106def9
ANDROID_NDK_FILE=android-ndk-r${TERMUX_NDK_VERSION}-Linux-x86_64.zip
ANDROID_NDK_SHA256=0fbb1645d0f1de4dde90a4ff79ca5ec4899c835e729d692f433fda501623257a


HTTP_PROXY=http://localhost:1080 wget -O tools.zip https://dl.google.com/android/repository/${ANDROID_SDK_FILE}
HTTP_PROXY=http://localhost:1080 wget -O ndk.zip https://dl.google.com/android/repository/${ANDROID_NDK_FILE}