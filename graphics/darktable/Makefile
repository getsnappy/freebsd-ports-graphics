# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	darktable
PORTVERSION=	1.6.0
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/darktable-org/${PORTNAME}/releases/download/release-${PORTVERSION}/

MAINTAINER=	dumbbell@FreeBSD.org
COMMENT=	Virtual lighttable and darkroom for photographers

LICENSE=	GPLv3

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS=	libexiv2.so:${PORTSDIR}/graphics/exiv2 \
		liblensfun.so:${PORTSDIR}/graphics/lensfun \
		liblcms2.so:${PORTSDIR}/graphics/lcms2 \
		libcurl.so:${PORTSDIR}/ftp/curl

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	uses SSE extensions

USES=		compiler:c++11-lib cmake:outsource desktop-file-utils	\
		ninja pkgconfig tar:xz
USE_GNOME=	librsvg2
USE_SQLITE=	yes
USE_LDCONFIG=	${PREFIX}/lib/${PORTNAME}
INSTALLS_ICONS=	yes
LDFLAGS+=	-L${LOCALBASE}/lib -lintl

OPTIONS_DEFINE=	COLORD DOCS FB_PICASA FLICKR GEO GNOMEKEYRING GPHOTO	\
		GRAPHMAGICK LUA NLS OPENEXR OPENJPEG OPENMP RAWSPEED	\
		SLIDESHOW SQUISH WEBP

GEO_DESC=	Support geotagging
FB_PICASA_DESC=	Support export to Facebook and Picasa
SQUISH_DESC=	Compress thumbnail via libsquish
RAWSPEED_DESC=	Compile with rawspeed backend
SLIDESHOW_DESC=	Build OpenGL/SDL slideshow viewer

OPTIONS_DEFAULT=COLORD FB_PICASA FLICKR GEO GPHOTO LUA NLS OPENEXR	\
		OPENJPEG RAWSPEED SLIDESHOW SQUISH WEBP
OPTIONS_SUB=	yes

CMAKE_ARGS+=	-DBINARY_PACKAGE_BUILD=1
CMAKE_ARGS+=	-DBUILD_CMSTEST:BOOL=ON
CMAKE_ARGS+=	-DUSE_KWALLET:BOOL=ON

# darktable 1.4 can use colord but provides its own libcolord,
# statically linked to libdarktable.so.
COLORD_LIB_DEPENDS=	libcolord.so:${PORTSDIR}/graphics/colord
COLORD_CMAKE_OFF=	-DUSE_COLORD:BOOL=OFF

FB_PICASA_LIB_DEPENDS=	libjson-glib-1.0.so:${PORTSDIR}/devel/json-glib
FB_PICASA_CMAKE_OFF=	-DUSE_GLIBJSON:BOOL=OFF

FLICKR_LIB_DEPENDS=	libflickcurl.so:${PORTSDIR}/www/flickcurl
FLICKR_CMAKE_OFF=	-DUSE_FLICKR:BOOL=OFF

GEO_LIB_DEPENDS=	libsoup-2.4.so:${PORTSDIR}/devel/libsoup
GEO_CMAKE_OFF=		-DUSE_GEO:BOOL=OFF

GNOMEKEYRING_LIB_DEPENDS=libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring
GNOMEKEYRING_CMAKE_OFF=	-DUSE_GNOME_KEYRING:BOOL=OFF

GPHOTO_LIB_DEPENDS=	libgphoto2.so:${PORTSDIR}/graphics/libgphoto2
GPHOTO_CMAKE_OFF=	-DUSE_CAMERA_SUPPORT:BOOL=OFF

GRAPHMAGICK_LIB_DEPENDS=libGraphicsMagick.so:${PORTSDIR}/graphics/GraphicsMagick
GRAPHMAGICK_CMAKE_OFF=	-DUSE_GRAPHICSMAGICK:BOOL=OFF

# darktable requires libsecret 1.16+.
#LIBSECRET_LIB_DEPENDS=	libsecret-1.so:${PORTSDIR}/security/libsecret
#LIBSECRET_CMAKE_OFF=	-DUSE_LIBSECRET:BOOL=OFF
CMAKE_ARGS+=		-DUSE_LIBSECRET:BOOL=OFF

LUA_USES=		lua
LUA_CMAKE_OFF=		-DUSE_LUA:BOOL=OFF

NLS_USES=		gettext
NLS_CMAKE_OFF=		-DUSE_NLS:BOOL=OFF

OPENEXR_LIB_DEPENDS=	libIlmImf.so:${PORTSDIR}/graphics/OpenEXR
OPENEXR_CMAKE_OFF=	-DUSE_OPENEXR:BOOL=OFF

OPENJPEG_LIB_DEPENDS=	libopenjpeg.so:${PORTSDIR}/graphics/openjpeg15
OPENJPEG_CMAKE_OFF=	-DUSE_OPENJPEG:BOOL=OFF

RAWSPEED_CMAKE_OFF=	-DDONT_USE_RAWSPEED:BOOL=ON

SLIDESHOW_USE=		GL=gl SDL=sdl
SLIDESHOW_CMAKE_OFF=	-DBUILD_SLIDESHOW:BOOL=OFF

SQUISH_BUILD_DEPENDS=	${LOCALBASE}/lib/libsquish.a:${PORTSDIR}/graphics/squish
SQUISH_CMAKE_OFF=	-DUSE_SQUISH:BOOL=OFF

WEBP_LIB_DEPENDS=	libwebp.so:${PORTSDIR}/graphics/webp
WEBP_CMAKE_OFF=		-DUSE_WEBP:BOOL=OFF

.include <bsd.port.pre.mk>

# -------------------------------------------------------------------
# OpenMP support.
#
# When g++ and libc++ are used together, darktable crashes. This needs
# some more debugging. Meanwhile, the same technique used on Mac OS X
# works: using GCC as the C compiler to have OpenMP support, but keep
# clang++ as the C++ compiler to avoid the G++/libc++ crash.

.if ${COMPILER_FEATURES:Mlibc++} && ${PORT_OPTIONS:MOPENMP}
# The following code is copied from bsd.gcc.mk.
V=48
_GCC_PORT_DEPENDS=gcc${V}
_GCC_PORT=gcc
BUILD_DEPENDS+=	${_GCC_PORT_DEPENDS}:${PORTSDIR}/lang/${_GCC_PORT}
RUN_DEPENDS+=	${_GCC_PORT_DEPENDS}:${PORTSDIR}/lang/${_GCC_PORT}
USE_BINUTILS=	yes

CC:=			gcc${V}
CPP:=			cpp${V}
_GCC_RUNTIME:=		${LOCALBASE}/lib/gcc${V}
CFLAGS+=		-Wl,-rpath=${_GCC_RUNTIME}
LDFLAGS+=		-Wl,-rpath=${_GCC_RUNTIME} -L${_GCC_RUNTIME}
.endif

OPENMP_CMAKE_ON=	-DUSE_OPENMP:BOOL=ON
OPENMP_CMAKE_OFF=	-DUSE_OPENMP:BOOL=OFF
# -------------------------------------------------------------------

.if defined(WITH_DEBUG)
CMAKE_BUILD_TYPE=	RelWithDebInfo
STRIP=
.endif

.if ! ${PORT_OPTIONS:MDOCS}
post-install:
	${RM} ${STAGEDIR}${DOCSDIR}/AUTHORS
	${RM} ${STAGEDIR}${DOCSDIR}/LICENSE
	${RM} ${STAGEDIR}${DOCSDIR}/README
	${RM} ${STAGEDIR}${DOCSDIR}/TRANSLATORS
	${RM} ${STAGEDIR}${DOCSDIR}/darktablerc.html
	${RMDIR} ${STAGEDIR}${DOCSDIR}
.endif

.include <bsd.port.post.mk>
