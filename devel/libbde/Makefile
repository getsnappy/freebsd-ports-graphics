# Created by: Antoine Brodin <antoine@FreeBSD.org>
# $FreeBSD$

PORTNAME=	libbde
DISTVERSION=	alpha-20141023
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libyal/libbde/releases/download/${PORTVERSION:E}/ \
		LOCAL/antoine

MAINTAINER=	antoine@FreeBSD.org
COMMENT=	Library and tools to access the BitLocker Drive Encryption volumes

LICENSE=	LGPL3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-python --with-libintl-prefix=${LOCALBASE} ${ICONV_CONFIGURE_ARG}
USES=		fuse gettext iconv libtool pathfix pkgconfig python:2
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:E}

PORTDOCS=	AUTHORS ChangeLog

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
