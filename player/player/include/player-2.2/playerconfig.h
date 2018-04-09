/* #undef HAVE_GEOS */
#define HAVE_CFMAKERAW 1
#define HAVE_DIRNAME 1
#define HAVE_LIBLTDL 1
/* #undef HAVE_PLAYERSD */
#define HAVE_POLL 1
#define HAVE_ROUND 1
#define HAVE_STDINT_H 1
#define HAVE_COMPRESSBOUND 1
/* #undef INCLUDE_RTK */
/* #undef INCLUDE_RTKGUI */
#define HAVE_CLOCK_GETTIME 1
#define HAVE_XDR_LONGLONG_T 1
#define HAVE_STL 1

#ifdef HAVE_STDINT_H
#include <stdint.h>
#endif
#include <sys/types.h>

/* Logging level to console and system log */
#define DEBUG_LEVEL NONE
