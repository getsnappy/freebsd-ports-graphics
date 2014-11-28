# Created by: Florent Thoumie <flz@freebsd.org>
# $FreeBSD$

PORTNAME=	xf86-video-scfb
PORTVERSION=	0.0.4
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ray@FreeBSD.org
COMMENT=	X.Org syscons display driver

USE_GITHUB=     yes
GH_ACCOUNT=     rayddteam
GH_PROJECT=     ${PORTNAME}
GH_TAGNAME=     bdeb3bf
GH_COMMIT=      bdeb3bf

GNU_CONFIGURE=  yes
USES=		libtool pkgconfig
USE_XORG=	glproto inputproto kbproto randrproto renderproto \
		resourceproto scrnsaverproto videoproto xextproto \
		xf86bigfontproto xf86driproto xproto
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
