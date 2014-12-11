# Created by: Bernhard Froehlich <decke@bluelife.at>
# $FreeBSD$

PORTNAME=	drm-i915-kmod
DISTVERSION=	10.1
CATEGORIES=	x11-drivers
MASTER_SITES=	http://people.freebsd.org/~dumbbell/
DISTNAME=	drm-i915-${DISTVERSION}

MAINTAINER=	x11@FreeBSD.org
COMMENT=	Kernel DRM driver for i915 GPUs

LICENSE=	MIT

USES=		tar:xz kmod
UNIQUENAME=	${PORTNAME}${PKGNAMESUFFIX}
ONLY_FOR_ARCHS=	i386 amd64

KMODNAME=	i915kms_port

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
MAKE_ARGS+=" HAVE_DEBUG=YES"
.endif

do-install:
	${INSTALL_KLD} ${WRKSRC}/${KMODNAME}.ko ${STAGEDIR}${KMODDIR}

.include <bsd.port.mk>
