# Created by: Jean-Yves Lefort <jylefort@brutele.be>
# $FreeBSD$

PORTNAME=	tea
PORTVERSION=	39.1.0
CATEGORIES=	editors
MASTER_SITES=	http://semiletov.org/tea/dloads/

MAINTAINER=	danilo@FreeBSD.org
COMMENT=	Simple and powerful Qt4-based text editor

LICENSE=	GPLv3

OPTIONS_DEFINE=		DOCS
OPTIONS_RADIO=		SPELL
OPTIONS_RADIO_SPELL=	ASPELL HUNSPELL
OPTIONS_DEFAULT=	ASPELL

USES=		qmake tar:bzip2
USE_QT4=	gui moc_build network rcc_build

PLIST_FILES=	bin/tea share/pixmaps/tea_icon_v2.png
PORTDOCS=	*

DESKTOP_ENTRIES="TEA" "" "${PREFIX}/share/pixmaps/tea_icon_v2.png" \
		"${PORTNAME}" "" ""

ASPELL_LIB_DEPENDS=	libaspell.so:${PORTSDIR}/textproc/aspell
ASPELL_QMAKE_ON=	USE_ASPELL=true
ASPELL_QMAKE_OFF=	USE_ASPELL=false

HUNSPELL_LIB_DEPENDS=	libhunspell-1.3.so:${PORTSDIR}/textproc/hunspell
HUNSPELL_QMAKE_ON=	USE_HUNSPELL=true
HUNSPELL_QMAKE_OFF=	USE_HUNSPELL=false

post-patch:
	@${REINPLACE_CMD} -e \
		's|Q_OS_LINUX|Q_OS_UNIX|' ${WRKSRC}/document.cpp
	@${REINPLACE_CMD} -e \
		's|/usr/include|${LOCALBASE}/include|' ${WRKSRC}/src.pro

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/tea ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/icons/tea_icon_v2.png ${STAGEDIR}${PREFIX}/share/pixmaps
	(cd ${WRKSRC}/manuals \
		&& ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
