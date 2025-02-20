QT += quick androidextras

CONFIG += c++11 lrelease embed_translations

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        fileio.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

include(vendor/vendor.pri)
#include(vendor/android/native/pri/androidnative.pri)
include(vendor/android_openssl/openssl.pri)

# ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/build.gradle \

contains(ANDROID_TARGET_ARCH,x86) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}

HEADERS += \
    fileio.h

DISTFILES += \
    LICENSE.txt \
    translations/*.ts \
    android/res/drawable/wallpaper_black.png \
    android/res/drawable/wallpaper_white.png \
    android/res/drawable/wallpaper_image.png \
    android/src/com/volla/launcher/activity/ReceiveTextActivity.java \
    android/src/com/volla/launcher/parser/ArticleParser.java \
    android/src/com/volla/launcher/util/AppUtil.java \
    android/src/com/volla/launcher/util/CalendarUtil.java \
    android/src/com/volla/launcher/util/LayoutUtil.java \
    android/src/com/volla/launcher/util/CallUtil.java \
    android/src/com/volla/launcher/util/VibrationUtil.java \
    android/src/com/volla/launcher/util/MessageUtil.java \
    android/src/com/volla/launcher/worker/AccountWorker.java \
    android/src/com/volla/launcher/worker/CallWorker.java \
    android/src/com/volla/launcher/worker/ContactWorker.java \
    android/src/com/volla/launcher/worker/MessageWorker.java \
    android/src/com/volla/launcher/worker/WallpaperWorker.java \
    android/src/com/volla/launcher/worker/AppWorker.java

TRANSLATIONS += \
    translations/Volla_de.ts \
    translations/Volla_cn.ts \
    translations/Volla_fr.ts \
    translations/Volla_nl.ts \
    translations/Volla_se.ts \
    translations/Volla_ro.ts \
    translations/Volla_es.ts \
    translations/Volla_bg.ts \
    translations/Volla_fi.ts \
    translations/Volla_it.ts \
    translations/Volla_sk.ts
