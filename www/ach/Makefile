# Created by: Carlo Strub <c-s@c-s.li>
# $FreeBSD$

PORTNAME=	ACH
PORTVERSION=	1.0.3
CATEGORIES=	www
MASTER_SITES=	http://cloud.github.com/downloads/Burton/Analysis-of-Competing-Hypotheses/
EXTRACT_SUFX=	-alpha.tar

MAINTAINER=	danilo@FreeBSD.org
COMMENT=	Free, open source tool for complex research problems

LICENSE=	GPLv3

USE_MYSQL=	yes
USE_PHP=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}-alpha
NO_BUILD=	yes
SUB_FILES+=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
WWWDIR?=	${PREFIX}/www/${PORTNAME}

# Get rid of temp files packaged in the upstream distfile
post-extract:
	@${FIND} ${WRKSRC} -type f -not -name .htaccess -a \
		-name .\* -delete

do-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR}

.include <bsd.port.mk>
