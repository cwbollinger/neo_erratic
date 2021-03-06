INCLUDE (${PLAYER_CMAKE_DIR}/PlayerUtils.cmake)

INCLUDE (CheckFunctionExists)
INCLUDE (CheckIncludeFiles)
INCLUDE (CheckLibraryExists)

SET (PLAYER_EXTRA_LIB_DIRS "" CACHE STRING "List of extra library directories.")
MARK_AS_ADVANCED (PLAYER_EXTRA_LIB_DIRS)
SET (PLAYER_EXTRA_INCLUDE_DIRS "" CACHE STRING "List of extra include directories.")
MARK_AS_ADVANCED (PLAYER_EXTRA_INCLUDE_DIRS)
SET (CMAKE_REQUIRED_INCLUDES ${PLAYER_EXTRA_INCLUDE_DIRS})

IF (PLAYER_OS_QNX)
    SET (CMAKE_REQUIRED_LIBRARIES socket)
ELSEIF (PLAYER_OS_SOLARIS)
    SET (CMAKE_REQUIRED_LIBRARIES socket nsl)
ENDIF (PLAYER_OS_QNX)
CHECK_FUNCTION_EXISTS (getaddrinfo HAVE_GETADDRINFO)
SET (CMAKE_REQUIRED_LIBRARIES)

IF (PLAYER_OS_QNX)
    SET (CMAKE_REQUIRED_LIBRARIES rpc)
ELSEIF (PLAYER_OS_SOLARIS)
    SET (CMAKE_REQUIRED_LIBRARIES nsl)
ENDIF (PLAYER_OS_QNX)
CHECK_FUNCTION_EXISTS (xdr_free HAVE_XDR)
IF (NOT HAVE_XDR)
    MESSAGE (STATUS "XDR was not found. This is necessary for Player to function.")
ENDIF (NOT HAVE_XDR)
CHECK_FUNCTION_EXISTS (xdr_longlong_t HAVE_XDR_LONGLONG_T)
SET (CMAKE_REQUIRED_LIBRARIES)

CHECK_FUNCTION_EXISTS (cfmakeraw HAVE_CFMAKERAW)
CHECK_FUNCTION_EXISTS (dirname HAVE_DIRNAME)
CHECK_INCLUDE_FILES (linux/joystick.h HAVE_LINUX_JOYSTICK_H)
CHECK_FUNCTION_EXISTS (poll HAVE_POLL)
CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)
CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)
CHECK_INCLUDE_FILES (dns_sd.h HAVE_DNS_SD)
CHECK_INCLUDE_FILES (sys/filio.h HAVE_SYS_FILIO_H)
IF (HAVE_DNS_SD)
    CHECK_LIBRARY_EXISTS (dns_sd DNSServiceRefDeallocate "${PLAYER_EXTRA_LIB_DIRS}" HAVE_DNS_SD)
ENDIF (HAVE_DNS_SD)
SET (CMAKE_REQUIRED_LIBRARIES dl)
CHECK_LIBRARY_EXISTS (ltdl lt_dlopenext "${PLAYER_EXTRA_LIB_DIRS}" HAVE_LIBLTDL)
SET (CMAKE_REQUIRED_LIBRARIES)

SET (CMAKE_REQUIRED_INCLUDES math.h)
SET (CMAKE_REQUIRED_LIBRARIES m)
CHECK_FUNCTION_EXISTS (round HAVE_ROUND)
SET (CMAKE_REQUIRED_INCLUDES)
SET (CMAKE_REQUIRED_LIBRARIES)

CHECK_LIBRARY_EXISTS (jpeg jpeg_read_header "${PLAYER_EXTRA_LIB_DIRS}" HAVE_LIBJPEG)
CHECK_INCLUDE_FILES ("stdio.h;jpeglib.h" HAVE_JPEGLIB_H)
IF (HAVE_LIBJPEG AND HAVE_JPEGLIB_H)
    SET (HAVE_JPEG TRUE)
ENDIF (HAVE_LIBJPEG AND HAVE_JPEGLIB_H)

SET (CMAKE_REQUIRED_INCLUDES zlib.h)
SET (CMAKE_REQUIRED_LIBRARIES z)
CHECK_FUNCTION_EXISTS (compressBound HAVE_COMPRESSBOUND)
SET (CMAKE_REQUIRED_INCLUDES)
SET (CMAKE_REQUIRED_LIBRARIES)

CHECK_LIBRARY_EXISTS (z compress2 "${PLAYER_EXTRA_LIB_DIRS}" HAVE_LIBZ)
CHECK_INCLUDE_FILES (zlib.h HAVE_ZLIB_H)
IF (HAVE_LIBZ AND HAVE_ZLIB_H)
    SET (HAVE_Z TRUE)
ENDIF (HAVE_LIBZ AND HAVE_ZLIB_H)

CHECK_LIBRARY_EXISTS (rt clock_gettime "${PLAYER_EXTRA_LIB_DIRS}" HAVE_LIBRT)
SET (CMAKE_REQUIRED_LIBRARIES rt)
CHECK_FUNCTION_EXISTS (clock_gettime HAVE_CLOCK_GETTIME_FUNC)
SET (CMAKE_REQUIRED_LIBRARIES)
IF (HAVE_LIBRT AND HAVE_CLOCK_GETTIME_FUNC)
    SET (HAVE_CLOCK_GETTIME TRUE)
ENDIF (HAVE_LIBRT AND HAVE_CLOCK_GETTIME_FUNC)

# Endianess check
INCLUDE (TestBigEndian)
TEST_BIG_ENDIAN (WORDS_BIGENDIAN)

# GTK checks
INCLUDE($ENV{ROS_ROOT}/core/rosbuild/FindPkgConfig.cmake)
IF (NOT PKG_CONFIG_FOUND)
    MESSAGE (STATUS "WARNING: Could not find pkg-config; cannot search for GTK or related.")
ELSE (NOT PKG_CONFIG_FOUND)
    pkg_check_modules (GNOMECANVAS_PKG libgnomecanvas-2.0)
    IF (GNOMECANVAS_PKG_FOUND)
        SET (WITH_GNOMECANVAS TRUE)
        # Because the FindPkgConfig module annoyingly separates *all* results, not just the dirs,
        # we have to unseparate the flags back into strings so they can be passed to the
        # SET_x_PROPERTIES functions properly. Change the LIST_TO_STRING to SET and make with
        # VERBOSE=1 to see the mess that happens otherwise.
        LIST_TO_STRING (GNOMECANVAS_LINKFLAGS "${GNOMECANVAS_PKG_LDFLAGS}")
        LIST_TO_STRING (GNOMECANVAS_CFLAGS "${GNOMECANVAS_PKG_CFLAGS}")
    ENDIF (GNOMECANVAS_PKG_FOUND)

    pkg_check_modules (GTK_PKG gtk+-2.0)
    IF (GTK_PKG_FOUND)
        SET (WITH_GTK TRUE)
        SET (GTK_INCLUDEDIR ${GTK_PKG_INCLUDE_DIRS})
        LIST_TO_STRING (GTK_LINKFLAGS "${GTK_PKG_LDFLAGS}")
        LIST_TO_STRING (GTK_CFLAGS "${GTK_PKG_CFLAGS}")
    ENDIF (GTK_PKG_FOUND)

    pkg_check_modules (GDKPIXBUF_PKG gdk-pixbuf-2.0)
    IF (GDKPIXBUF_PKG_FOUND)
        SET (WITH_GDKPIXBUF TRUE)
        LIST_TO_STRING (GDKPIXBUF_LINKFLAGS "${GDKPIXBUF_PKG_LDFLAGS}")
        LIST_TO_STRING (GDKPIXBUF_CFLAGS "${GDKPIXBUF_PKG_CFLAGS}")
    ENDIF (GDKPIXBUF_PKG_FOUND)
ENDIF (NOT PKG_CONFIG_FOUND)

IF (PLAYER_OS_QNX)
    SET (PTHREAD_LIB)
    SET (SOCKET_LIBS socket)
    SET (SOCKET_LIBS_FLAGS -lsocket)
ELSEIF (PLAYER_OS_SOLARIS)
    SET (PTHREAD_LIB -lpthread)
    SET (SOCKET_LIBS socket nsl)
    SET (SOCKET_LIBS_FLAGS "-lsocket -lnsl")
ELSE (PLAYER_OS_QNX)
    SET (PTHREAD_LIB -lpthread)
    SET (SOCKET_LIBS)
    SET (SOCKET_LIBS_FLAGS)
ENDIF (PLAYER_OS_QNX)

# STL check
SET (testSTLSource ${CMAKE_CURRENT_BINARY_DIR}/CMakeTmp/test_stl.cpp)
FILE (WRITE ${testSTLSource}
    "#include <string>\nint main () {std::string a = \"blag\"; return 0;}\n")
TRY_COMPILE (HAVE_STL ${CMAKE_CURRENT_BINARY_DIR} ${testSTLSource})

SET (CMAKE_REQUIRED_INCLUDES)
