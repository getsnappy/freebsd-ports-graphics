# $FreeBSD$

PORTNAME=	xcb-util-cursor
PORTVERSION=	0.1.1
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	x11@FreeBSD.org
COMMENT=	XCB cursor library

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:${PORTSDIR}/x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:${PORTSDIR}/x11/xcb-util-image \
		${LOCALBASE}/bin/gperf:${PORTSDIR}/devel/gperf
		
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/xcb-util.pc:${PORTSDIR}/x11/xcb-util \
		${LOCALBASE}/libdata/pkgconfig/xcb-renderutil.pc:${PORTSDIR}/x11/xcb-util-renderutil \
		${LOCALBASE}/libdata/pkgconfig/xcb-image.pc:${PORTSDIR}/x11/xcb-util-image

XORG_CAT=	lib
USE_XORG=	xcb
USES=		gmake

CONFIGURE_ENV=	GPERF="${LOCALBASE}/bin/gperf"

post-patch:
	@${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
