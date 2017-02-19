TEMPLATE = app

QT += qml quick
QT += multimedia multimediawidgets
CONFIG += c++11

SOURCES += main.cpp \
    read.cpp \
    settings.cpp

RESOURCES += qml.qrc \
    ress.qrc \
    ressounds.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    read.h \
    settings.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
