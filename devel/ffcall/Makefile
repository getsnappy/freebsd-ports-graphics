# Created by: jagapen@home.com
# $FreeBSD$

PORTNAME=	ffcall
PORTVERSION=	1.10
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.santafe.edu/pub/gnu/
MASTER_SITES+=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Foreign function call libraries

LICENSE=	GPLv2

GNU_CONFIGURE=	yes
USES=		gmake libtool

CONFIGURE_TARGET=	${ARCH:S/amd64/x86_64/}-portbld-${OPSYS:tl}${OSREL}
MAKE_JOBS_UNSAFE=	yes

CFLAGS+=	-fPIC

.include <bsd.port.mk>
