# Created by: Tom McLaughlin <tmclaugh@sdf.lonestar.org>
# $FreeBSD$

PORTNAME=	libgdiplus
PORTVERSION=	3.8
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/

MAINTAINER=	mono@FreeBSD.org
COMMENT=	GDI+ API for System.Windows.Forms in Mono

LIB_DEPENDS=	libtiff.so:${PORTSDIR}/graphics/tiff \
		libgif.so:${PORTSDIR}/graphics/giflib \
		libpng15.so:${PORTSDIR}/graphics/png \
		libcairo.so:${PORTSDIR}/graphics/cairo

GNU_CONFIGURE=	yes
USES=		gmake libtool:keepla pathfix pkgconfig
USE_GNOME=	glib20
USE_LDCONFIG=	yes
USE_XORG=	x11
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/libpng15
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

PLIST_FILES=	lib/libgdiplus.a \
		lib/libgdiplus.la \
		lib/libgdiplus.so \
		lib/libgdiplus.so.0 \
		lib/libgdiplus.so.0.0.0 \
		libdata/pkgconfig/libgdiplus.pc

.include <bsd.port.mk>
