PLAYERDRIVER_OPTION (wavefront build_wavefront ON)
PLAYERDRIVER_REQUIRE_PKG (wavefront build_wavefront gdk-pixbuf-2.0
    wavefront_includeDir wavefront_libDir wavefront_linkFlags wavefront_cFlags)
PLAYERDRIVER_ADD_DRIVER (wavefront build_wavefront
    INCLUDEDIRS "${wavefront_includeDir}" LIBDIRS "${wavefront_libDir}"
    LINKFLAGS "${wavefront_linkFlags}" CFLAGS "${wavefront_cFlags}"
    SOURCES plan.c plan_plan.c plan_waypoint.c wavefront.cc heap.c plan_control.c)

# Also build and install standalone non-Player lib
PLAYER_ADD_LIBRARY (wavefront_standalone plan.c plan_plan.c plan_waypoint.c heap.c plan_control.c)
PLAYER_INSTALL_HEADERS (standalone_drivers plan.h heap.h)
