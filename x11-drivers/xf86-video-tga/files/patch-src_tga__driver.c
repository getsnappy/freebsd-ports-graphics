--- src/tga_driver.c.orig	2012-07-16 03:54:28 UTC
+++ src/tga_driver.c
@@ -46,8 +46,6 @@
 
 /* software cursor */
 #include "mipointer.h"
-/* backing store */
-#include "mibstore.h"
 
 /*  #include "mibank.h" */
 /* colormap manipulation */
@@ -1451,7 +1449,6 @@ TGAScreenInit(SCREEN_INIT_ARGS_DECL)
     
     fbPictureInit (pScreen, 0, 0);
     
-    miInitializeBackingStore(pScreen);
     xf86SetBackingStore(pScreen);
     xf86SetSilkenMouse(pScreen);
 
