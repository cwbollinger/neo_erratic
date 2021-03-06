INCLUDE_DIRECTORIES (${PROJECT_SOURCE_DIR}/client_libs ${GTK_INCLUDEDIR})

ADD_EXECUTABLE (vmap vmap.c)
TARGET_LINK_LIBRARIES (vmap playerc playerxdr playererror ${PLAYERC_EXTRA_LINK_LIBRARIES})

ADD_EXECUTABLE (simple simple.c)
TARGET_LINK_LIBRARIES (simple playerc playerxdr playererror ${PLAYERC_EXTRA_LINK_LIBRARIES})

ADD_EXECUTABLE (speech_c_client speech_c_client.c)
TARGET_LINK_LIBRARIES (speech_c_client playerc playerxdr playererror ${PLAYERC_EXTRA_LINK_LIBRARIES})

IF (HAVE_PLAYERSD)
    ADD_EXECUTABLE (service_discovery service_discovery.c)
    TARGET_LINK_LIBRARIES (service_discovery playerc playerxdr playererror playersd playerutils ${PLAYERC_EXTRA_LINK_LIBRARIES})
ENDIF (HAVE_PLAYERSD)

# Install the example source
SET (exampleCMakeLists_in ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt.example.in)
SET (exampleCMakeLists ${CMAKE_CURRENT_BINARY_DIR}/CMakeLists.txt.example)
CONFIGURE_FILE (${exampleCMakeLists_in} ${exampleCMakeLists} @ONLY)
INSTALL (FILES ${exampleCMakeLists} DESTINATION share/${PROJECT_NAME_LOWER}/examples/libplayerc RENAME CMakeLists.txt)
SET (exampleSrcs vmap.c simple.c speech_c_client.c service_discovery.c README)
INSTALL (FILES ${exampleSrcs} DESTINATION share/${PROJECT_NAME_LOWER}/examples/libplayerc)
