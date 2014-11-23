--- src/sis_driver.c.orig	2012-07-17 05:20:28 UTC
+++ src/sis_driver.c
@@ -57,7 +57,6 @@
 #include "fb.h"
 #include "micmap.h"
 #include "mipointer.h"
-#include "mibstore.h"
 #include "edid.h"
 
 #define SIS_NEED_inSISREG
@@ -8859,7 +8858,6 @@ SISScreenInit(SCREEN_INIT_ARGS_DECL)
     }
     pSiS->SiSFastVidCopyDone = TRUE;
 
-    miInitializeBackingStore(pScreen);
     xf86SetBackingStore(pScreen);
     xf86SetSilkenMouse(pScreen);
 
