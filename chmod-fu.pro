TEMPLATE = app
TARGET = chmod-fu

CONFIG += qt warn_on debug_and_release cascades

INCLUDEPATH += ../src $(QNX_TARGET)/usr/include/bb/system
SOURCES += ../src/*.cpp
HEADERS += ../src/*.h
DEPENDPATH += ${QNX_TARGET}/usr/include/bb/system
LIBS += -lbbsystem

lupdate_inclusion {
    SOURCES += ../assets/*.qml
    SOURCES += ../assets/about/*.qml
    SOURCES += ../assets/manpage/*.qml
}

device {
	CONFIG(release, debug|release) {
		DESTDIR = o.le-v7
	}
	CONFIG(debug, debug|release) {
		DESTDIR = o.le-v7-g
	}
}

simulator {
	CONFIG(release, debug|release) {
		DESTDIR = o
	}
	CONFIG(debug, debug|release) {
		DESTDIR = o-g
	}
}

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
RCC_DIR = $${DESTDIR}/.rcc
UI_DIR = $${DESTDIR}/.ui

suredelete.target = sureclean
suredelete.commands = $(DEL_FILE) $${MOC_DIR}/*; $(DEL_FILE) $${RCC_DIR}/*; $(DEL_FILE) $${UI_DIR}/*
suredelete.depends = distclean

QMAKE_EXTRA_TARGETS += suredelete

TRANSLATIONS = \
    $${TARGET}_sv_SE.ts \
    $${TARGET}.ts

