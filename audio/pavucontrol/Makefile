# Created by: Romain Tartière <romain@blogreen.org>
# $FreeBSD$

PORTNAME=	pavucontrol
PORTVERSION=	0.9.10
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://0pointer.de/lennart/projects/${PORTNAME}/

MAINTAINER=	romain@FreeBSD.org
COMMENT=	GTK mixer for PulseAudio

LIB_DEPENDS=	libglademm-2.4.so:${PORTSDIR}/devel/libglademm24 \
		libpulse.so:${PORTSDIR}/audio/pulseaudio \
		libcanberra.so:${PORTSDIR}/audio/libcanberra

GNU_CONFIGURE=	yes
USES=		gettext gmake pkgconfig
USE_GNOME=	intltool

CONFIGURE_ARGS=	--disable-lynx
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

.include <bsd.port.mk>
