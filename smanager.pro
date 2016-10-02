TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    blit.cpp \
    uld-filter-project/uldfilterproject.cpp \
    uld-filter-project/uldhelper.cpp \
    uld-filter-project/uldsocket.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    blit.h \
    uld-filter-project/qobject__.h \
    uld-filter-project/uldfilterproject.h \
    uld-filter-project/uldhelper.h \
    uld-filter-project/uldsocket.h

DISTFILES += \
    ImageList.qml
