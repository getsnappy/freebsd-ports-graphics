# Created by: Cristiano Rolim Pereira <cristianorolim@outlook.com>
# $FreeBSD$

PORTNAME=	vera++
PORTVERSION=	1.2.1
CATEGORIES=	devel
MASTER_SITES=	https://bitbucket.org/verateam/vera/downloads/
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.gz \
		${PORTNAME}-${PORTVERSION}-doc.tar.gz

MAINTAINER=	cristianorolim@outlook.com
COMMENT=	Tool for verification of C++ source code

BUILD_DEPENDS=	boost-libs>=0:${PORTSDIR}/devel/boost-libs

USES=		cmake:outsource tk

CMAKE_ARGS+=	-DTCL_INCLUDE_PATH=${TCL_INCLUDEDIR} \
		-DTK_INCLUDE_PATH=${TK_INCLUDEDIR}

post-install:
	${INSTALL_MAN} ${WRKDIR}/vera++.1 ${STAGEDIR}${PREFIX}/man/man1

.include <bsd.port.mk>
