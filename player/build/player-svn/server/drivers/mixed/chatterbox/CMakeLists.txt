PLAYERDRIVER_OPTION (chatterbox build_chatterbox OFF "Experimental")
SET (robostix "/home/gumstix/vR1078experimental/robostix")
PLAYERDRIVER_ADD_DRIVER (chatterbox build_chatterbox
    LINKFLAGS "-L${robostix}/gumstix/roomba -lroboi2c"
    CFLAGS "-I${robostix}/Shared -I${robostix}/gumstix/Common -I${robostix}/gumstix/roomba"
    SOURCES cb_driver.cc cb_i2c.c)
