# Created by: Kuang-che Wu <kcwu@csie.org>
# $FreeBSD$

PORTNAME=	libchewing
PORTVERSION=	0.3.4
PORTREVISION=	1
CATEGORIES=	chinese textproc
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@FreeBSD.org
COMMENT=	The Chewing intelligent phonetic input method library

USES=		tar:bzip2 gmake pkgconfig pathfix libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

DATADIR=	${PREFIX}/share/chewing
PROJECTHOST=	chewing
INFO=		libchewing

.include <bsd.port.pre.mk>

.if ${ARCH} == "powerpc"
BROKEN=		Does not install on powerpc: signal 6
.endif

.include <bsd.port.post.mk>
