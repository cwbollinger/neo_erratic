PLAYERDRIVER_OPTION (segwayrmp build_segwayrmp OFF "Disabled by default")
SET (CANLIB_DIR "" CACHE STRING "Directory containing the CANLIB headers and libraries")
MARK_AS_ADVANCED (CANLIB_DIR)
IF (NOT "${CANLIB_DIR}" STREQUAL "")
    SET (segwayrmpReqHeader "canlib.h")
    SET (segwayrmpExtraFlags "")
    SET (segwayrmpExtraLibs "-lcanlib")
ELSE (NOT "${CANLIB_DIR}" STREQUAL "")
    SET (segwayrmpReqHeader "${CANLIB_DIR}/include/canlib.h")
    SET (segwayrmpExtraFlags "-I${CANLIB_DIR}/include")
    SET (segwayrmpExtraLibs "-L${CANLIB_DIR}/lib -lcanlib")
ENDIF (NOT "${CANLIB_DIR}" STREQUAL "")
PLAYERDRIVER_REQUIRE_HEADER (segwayrmpifk build_segwayrmpifk ${segwayrmpReqHeader})
PLAYERDRIVER_ADD_DRIVER (segwayrmpifk build_segwayrmpifk
    LINKFLAGS ${segwayrmpExtraLibs} CFLAGS "${segwayrmpExtraFlags}"
    SOURCES segwayrmp.cc canio_kvaser.cc)
