CMAKE_MINIMUM_REQUIRED (VERSION 2.4 FATAL_ERROR)
INCLUDE (PlayerUtils)

INCLUDE($ENV{ROS_ROOT}/core/rosbuild/FindPkgConfig.cmake)
IF (NOT PKG_CONFIG_FOUND)
    MESSAGE (FATAL_ERROR "Could not find pkg-config.")
ELSE (NOT PKG_CONFIG_FOUND)
    pkg_check_modules (PLUGIN_PLAYERC playerc)
    IF (NOT PLUGIN_PLAYERC_FOUND)
        MESSAGE (FATAL_ERROR "Could not find playerc with pkg-config.")
    ENDIF (NOT PLUGIN_PLAYERC_FOUND)
ENDIF (NOT PKG_CONFIG_FOUND)
LIST_TO_STRING (PLUGIN_PLAYERC_CFLAGS_STR "${PLUGIN_PLAYERC_CFLAGS}")
LIST_TO_STRING (PLUGIN_PLAYERC_LDFLAGS_STR "${PLUGIN_PLAYERC_LDFLAGS}")

INCLUDE($ENV{ROS_ROOT}/core/rosbuild/FindPkgConfig.cmake)
IF (NOT PKG_CONFIG_FOUND)
    MESSAGE (FATAL_ERROR "Could not find pkg-config.")
ELSE (NOT PKG_CONFIG_FOUND)
    pkg_check_modules (PLAYERCORE playercore)
    IF (NOT PLAYERCORE_FOUND)
        MESSAGE (FATAL_ERROR "Could not find playercore with pkg-config.")
    ENDIF (NOT PLAYERCORE_FOUND)
ENDIF (NOT PKG_CONFIG_FOUND)
LIST_TO_STRING (PLAYERCORE_CFLAGS_STR "${PLAYERCORE_CFLAGS}")
LIST_TO_STRING (PLAYERCORE_LDFLAGS_STR "${PLAYERCORE_LDFLAGS}")


# This is slightly different from the one used by the Player build system itself.
# It takes a single file instead of a directory. It also expects playerinterfacegen.py
# to have been installed in the system path (as it should have been with Player).
MACRO (PROCESS_INTERFACES _file _outputFile)
    ADD_CUSTOM_COMMAND (OUTPUT ${_outputFile}
        COMMAND playerinterfacegen.py ${ARGN} ${_file} > ${_outputFile}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        DEPENDS ${_file}
    )
ENDMACRO (PROCESS_INTERFACES)

MACRO (PROCESS_XDR _interfaceH _xdrH _xdrC)
    ADD_CUSTOM_COMMAND (OUTPUT ${_xdrH} ${_xdrC}
        COMMAND playerxdrgen.py ${_interfaceH} ${_xdrC} ${_xdrH}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${_interfaceH})
ENDMACRO (PROCESS_XDR)


###############################################################################
# Macro to build a plugin driver.
# _driverName: The name of the driver library to create
# Pass source files, flags, etc. as extra args preceded by keywords as follows:
# SOURCES <source file list>
# INCLUDEDIRS <include directories list>
# LIBDIRS <library directories list>
# LINKFLAGS <link flags list>
# CFLAGS <compile flags list>
# See the examples directory (typically, ${prefix}/share/player/examples) for
# example CMakeLists.txt files.
MACRO (PLAYER_ADD_PLUGIN_DRIVER _driverName)
    PLAYER_PROCESS_ARGUMENTS (_srcs _includeDirs _libDirs _linkFlags _cFlags _junk ${ARGN})
    IF (_junk)
        MESSAGE (STATUS "WARNING: unkeyworded arguments found in PLAYER_ADD_PLUGIN_DRIVER: ${_junk}")
    ENDIF (_junk)
    LIST_TO_STRING (_cFlags "${_cFlags}")

    IF (_includeDirs OR PLAYERCORE_INCLUDE_DIRS)
        INCLUDE_DIRECTORIES (${_includeDirs} ${PLAYERCORE_INCLUDE_DIRS})
    ENDIF (_includeDirs OR PLAYERCORE_INCLUDE_DIRS)
    IF (_libDirs OR PLAYERCORE_LIBRARY_DIRS)
        LINK_DIRECTORIES (${_libDirs} ${PLAYERCORE_LIBRARY_DIRS})
    ENDIF (_libDirs OR PLAYERCORE_LIBRARY_DIRS)

    ADD_LIBRARY (${_driverName} SHARED ${_srcs})
    SET_TARGET_PROPERTIES (${_driverName} PROPERTIES
        LINK_FLAGS ${PLAYERCORE_LDFLAGS_STR} ${_linkFlags}
        INSTALL_RPATH ${PLAYERCORE_LIBDIR}
        BUILD_WITH_INSTALL_RPATH TRUE)

    # Get the current cflags for each source file, and add the global ones
    # (this allows the user to specify individual cflags for each source file
    # without the global ones overriding them).
    IF (PLAYERCORE_CFLAGS_STR OR _cFLags)
        FOREACH (_file ${_srcs})
            GET_SOURCE_FILE_PROPERTY (_fileCFlags ${_file} COMPILE_FLAGS)
            IF (_fileCFlags STREQUAL NOTFOUND)
                SET (_newCFlags "${PLAYERCORE_CFLAGS_STR} ${_cFlags}")
            ELSE (_fileCFlags STREQUAL NOTFOUND)
                SET (_newCFlags "${_fileCFlags} ${PLAYERCORE_CFLAGS_STR} ${_cFlags}")
            ENDIF (_fileCFlags STREQUAL NOTFOUND)
            SET_SOURCE_FILES_PROPERTIES (${_file} PROPERTIES
                COMPILE_FLAGS ${_newCFlags})
        ENDFOREACH (_file)
    ENDIF (PLAYERCORE_CFLAGS_STR OR _cFLags)
ENDMACRO (PLAYER_ADD_PLUGIN_DRIVER)


###############################################################################
# Macro to build a plugin interface.
# This macro will create generated sources prefixed with the interface name
# _interfName: The name of the interface library (not the interface itself!)
#              to create
# _interfDef: The interface definition file
#
# Pass source files, flags, etc. as extra args preceded by keywords as follows:
# SOURCES <source file list>
# INCLUDEDIRS <include directories list>
# LIBDIRS <library directories list>
# LINKFLAGS <link flags list>
# CFLAGS <compile flags list>
# See the examples directory (typically, ${prefix}/share/player/examples) for
# example CMakeLists.txt files.
INCLUDE (FindPythonInterp)
MACRO (PLAYER_ADD_PLUGIN_INTERFACE _interfName _interfDef)
    IF (NOT PYTHONINTERP_FOUND)
        MESSAGE (FATAL_ERROR "No Python interpreter found. Cannot continue.")
    ENDIF (NOT PYTHONINTERP_FOUND)

    PLAYER_PROCESS_ARGUMENTS (_srcs _includeDirs _libDirs _linkFlags _cFlags _junk ${ARGN})
    IF (_junk)
        MESSAGE (STATUS
                "WARNING: unkeyworded arguments found in PLAYER_ADD_PLUGIN_INTERFACE: ${_junk}")
    ENDIF (_junk)
    LIST_TO_STRING (_cFlags "${_cFlags}")

    IF (_includeDirs OR PLUGIN_PLAYERC_INC_DIR)
        INCLUDE_DIRECTORIES (${_includeDirs} ${PLUGIN_PLAYERC_INC_DIR} ${CMAKE_CURRENT_BINARY_DIR})
    ENDIF (_includeDirs OR PLUGIN_PLAYERC_INC_DIR)
    IF (_libDirs OR PLUGIN_PLAYERC_LIBRARY_DIRS)
        LINK_DIRECTORIES (${_libDirs} ${PLUGIN_PLAYERC_LIBRARY_DIRS})
    ENDIF (_libDirs OR PLUGIN_PLAYERC_LIBRARY_DIRS)

    # Have to generate some source files
    SET (interface_h ${CMAKE_CURRENT_BINARY_DIR}/${_interfName}_interface.h)
    PROCESS_INTERFACES (${_interfDef} ${interface_h} --plugin)
    SET (functiontable_c ${CMAKE_CURRENT_BINARY_DIR}/${_interfName}_functiontable.c)
    PROCESS_INTERFACES (${_interfDef} ${functiontable_c} --plugin --functiontable)
    SET_SOURCE_FILES_PROPERTIES (${functiontable_c} PROPERTIES
                                COMPILE_FLAGS ${PLUGIN_PLAYERC_CFLAGS_STR})
    SET (xdr_h ${CMAKE_CURRENT_BINARY_DIR}/${_interfName}_xdr.h)
    SET (xdr_c ${CMAKE_CURRENT_BINARY_DIR}/${_interfName}_xdr.c)
    PROCESS_XDR (${interface_h} ${xdr_h} ${xdr_c})
    SET_SOURCE_FILES_PROPERTIES (${xdr_c} PROPERTIES COMPILE_FLAGS ${PLUGIN_PLAYERC_CFLAGS_STR})

    ADD_LIBRARY (${_interfName} SHARED ${interface_h} ${functiontable_c} ${xdr_h} ${xdr_c} ${_srcs})
    SET_TARGET_PROPERTIES (${_interfName} PROPERTIES
        LINK_FLAGS ${PLUGIN_PLAYERC_LDFLAGS_STR} ${_linkFlags}
        INSTALL_RPATH ${PLUGIN_PLAYERC_LIBDIR}
        BUILD_WITH_INSTALL_RPATH TRUE)

    # Get the current cflags for each source file, and add the global ones
    # (this allows the user to specify individual cflags for each source file
    # without the global ones overriding them).
    IF (PLUGIN_PLAYERC_CFLAGS_STR OR _cFLags)
        FOREACH (_file ${_srcs})
            GET_SOURCE_FILE_PROPERTY (_fileCFlags ${_file} COMPILE_FLAGS)
            IF (_fileCFlags STREQUAL NOTFOUND)
                SET (_newCFlags "${PLUGIN_PLAYERC_CFLAGS_STR} ${_cFlags}")
            ELSE (_fileCFlags STREQUAL NOTFOUND)
                SET (_newCFlags "${_fileCFlags} ${PLUGIN_PLAYERC_CFLAGS_STR} ${_cFlags}")
            ENDIF (_fileCFlags STREQUAL NOTFOUND)
            SET_SOURCE_FILES_PROPERTIES (${_file} PROPERTIES
                COMPILE_FLAGS ${_newCFlags})
        ENDFOREACH (_file)
    ENDIF (PLUGIN_PLAYERC_CFLAGS_STR OR _cFLags)
ENDMACRO (PLAYER_ADD_PLUGIN_INTERFACE)
