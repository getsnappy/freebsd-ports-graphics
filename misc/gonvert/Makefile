# Created by: Ying-Chieh Liao <ijliao@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gonvert
PORTVERSION=	0.2.37
CATEGORIES=	misc python gnome
MASTER_SITES=	http://www.unihedron.com/projects/gonvert/downloads/

MAINTAINER=	nemysis@FreeBSD.org
COMMENT=	Conversion utility that allows conversion between many units

LICENSE=	GPLv2

USE_GNOME=	pygtk2
USES=		python
NO_BUILD=	yes

PORTDOCS=	CHANGELOG FAQ README THANKS

OPTIONS_DEFINE=	DOCS NLS

OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|#!/usr/bin/python|#!/usr/bin/env python|g ; \
		 s|/usr/share|${PREFIX}/share|g ; \
		 s|/\.\./pixmaps/|/pixmaps/|g' ${WRKSRC}/gonvert

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin/
	@${MKDIR} ${STAGEDIR}${DESKTOPDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.desktop ${STAGEDIR}${DESKTOPDIR}
	@${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.glade ${STAGEDIR}${DATADIR}
	@${MKDIR} ${STAGEDIR}${DATADIR}/pixmaps
	${INSTALL_DATA} ${WRKSRC}/pixmaps/*.png ${STAGEDIR}${DATADIR}/pixmaps/
	${LN} -sf ${DATADIR}/pixmaps/${PORTNAME}.png ${STAGEDIR}${PREFIX}/share/pixmaps/

.if ${PORT_OPTIONS:MNLS}
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/locale/pl/LC_MESSAGES
	${INSTALL_DATA} ${WRKSRC}/i18n/pl_messages.gmo \
		${STAGEDIR}${PREFIX}/share/locale/pl/LC_MESSAGES/gonvert.mo
.endif

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
