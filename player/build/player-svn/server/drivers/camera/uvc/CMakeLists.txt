PLAYERDRIVER_OPTION (camerauvc build_camerauvc ON)
PLAYERDRIVER_REQUIRE_HEADER (camerauvc build_camerauvc linux/videodev2.h sys/time.h linux/types.h)
PLAYERDRIVER_ADD_DRIVER (camerauvc build_camerauvc SOURCES cameraUVC.cc UvcInterface.cc)
