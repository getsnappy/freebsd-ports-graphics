# Created by: Koop Mast <kwm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	libclc
DISTVERSION=	0.0.r${SVN_REV}
CATEGORIES=	devel
MASTER_SITES=	LOCAL/kwm

MAINTAINER=	kwm@FreeBSD.org
COMMENT=	Required library functions for OpenCL C programming language

BUILD_DEPENDS=	clang${LLVMVER}:${PORTSDIR}/lang/clang${LLVMVER}

GNU_CONFIGURE=	yes
USES=		gmake python:build ninja tar:xz
USE_LDCONFIG=	yes
MAKE_ENV=	MAKE=${GMAKE} DESTDIR=${STAGEDIR}

LLVMVER=	34

ALL_TARGET=	

#.include <bsd.port.pre.mk>

.if !defined(SVN_REV)
.if defined(BOOTSTRAP)
LANG=		"C"
SVN_REV!=	svn info http://llvm.org/svn/llvm-project/ | ${GREP} Revision | cut -d' ' -f2
.else
.include "Makefile.svn_rev"
.endif
.endif

.if defined(BOOTSTRAP) || defined(SVN_FETCH)
FETCH_DEPENDS+=	svn:${PORTSDIR}/devel/subversion

do-fetch:
	${MKDIR} ${WRKDIR}
	svn export -r ${SVN_REV} \
	    http://llvm.org/svn/llvm-project/libclc/trunk ${WRKSRC}
	cd ${WRKDIR}; tar cvfJ ${DISTDIR}/${DISTNAME}.tar.xz ${DISTNAME}
	echo "SVN_REV=	${SVN_REV}" > ${MASTERDIR}/Makefile.svn_rev
.if ${USER} == kwm
	scp ${DISTDIR}/${DISTNAME}.tar.xz \
	    kwm@freefall.freebsd.org:public_distfiles/
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|python|${PYTHON_VERSION}|g' \
		-e 's|/usr/bin/python|${PYTHON_CMD}|g' \
		${WRKSRC}/build/ninja_syntax.py \
		${WRKSRC}/configure.py

do-configure:
	@cd ${WRKSRC} && ${PYTHON_CMD} configure.py -g ninja \
		--with-llvm-config=${LOCALBASE}/bin/llvm-config${LLVMVER} \
		--pkgconfigdir=${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
