# Created by: aaron@FreeBSD.org
# $FreeBSD$

PORTNAME=	libdungeonmaker
PORTVERSION=	2.05
CATEGORIES=	games devel
MASTER_SITES=	SF/dungeonmaker/dungeonmaker/${PORTVERSION}
DISTNAME=	dungeonmaker-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Program/library that "grows" dungeons for use in isometric games

USE_LDCONFIG=	yes

SUB_FILES=	pkg-message

MAKEFILE=	Makefile.bsd

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.pre.mk>

.if ${OPSYS} == FreeBSD && ${OSVERSION} >= 1000024 && ${OSVERSION} < 1000705
BROKEN=		doesn't build with clang 3.3 (e.g. on FreeBSD 10.0)
.endif

do-install:
	${INSTALL_LIB} ${WRKSRC}/libdungeonmaker.a ${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libdungeonmaker.so ${STAGEDIR}${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libdungeonmaker.so.2 ${STAGEDIR}${PREFIX}/lib
	${INSTALL} ${WRKSRC}/DungeonMaker.h ${STAGEDIR}${PREFIX}/include
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/DM2_Manual/* ${STAGEDIR}${DOCSDIR}
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/design* ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/main.cpp ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.post.mk>
