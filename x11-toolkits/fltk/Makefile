# Created by: Dima Sivachenko <dima@Chg.RU>
# $FreeBSD$

PORTNAME=	fltk
PORTVERSION=	1.3.2
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://fltk.org/pub/${PORTNAME}/${PORTVERSION}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Cross-platform C++ graphical user interface toolkit

LICENSE=	LGPL20

OPTIONS_DEFINE=	DOCS

LIB_DEPENDS=	libpng15.so:${PORTSDIR}/graphics/png \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

USE_LDCONFIG=	yes
USE_XORG=	xft
USE_GL=		glu
USES=		pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--enable-threads \
		--enable-shared \
		--enable-xft

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${WRKSRC}/src -L${LOCALBASE}/lib

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTDOCS=	*

.include <bsd.port.options.mk>

post-patch:
	prefix="${PREFIX}" ; plength=$$(($${#prefix}+10)) ; \
	${REINPLACE_CMD} -e "\|/etc/fltk|{s||${PREFIX}&|;s|10|$${plength}|;}" \
	${WRKSRC}/src/Fl_Preferences.cxx

.if ${PORT_OPTIONS:MDOCS}
post-install:
	cd ${WRKSRC}/documentation && ${MAKE} ${MAKE_ARGS} docinstall
	cd ${WRKSRC}/test && ${MAKE} ${MAKE_ARGS} install
.endif

.include <bsd.port.mk>
