# Created by: niels <niels@FreeBSD.org>
# $FreeBSD$

PORTNAME=	robots
PORTVERSION=	0.10.1
PORTREVISION=	1
CATEGORIES=	www rubygems
MASTER_SITES=	RG

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Simple library to parse robots.txt files

LICENSE=	MIT

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

post-extract:
	${CHMOD} -R a+r ${WRKSRC}

.include <bsd.port.mk>
