# Created by: ports@c0decafe.net
# $FreeBSD$

PORTNAME=	perlbrew
PORTVERSION=	0.59
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:GUGOD
PKGNAMEPREFIX=	p5-
DISTNAME=	App-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Perl Environment manager

LICENSE=	MIT

BUILD_DEPENDS=	p5-CPAN-Perl-Releases>=0.76:${PORTSDIR}/devel/p5-CPAN-Perl-Releases \
		p5-Capture-Tiny>=0.20:${PORTSDIR}/devel/p5-Capture-Tiny \
		p5-Devel-PatchPerl>=0.76:${PORTSDIR}/devel/p5-Devel-PatchPerl \
		p5-local-lib>=1.008004:${PORTSDIR}/devel/p5-local-lib
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-IO-All>=0:${PORTSDIR}/devel/p5-IO-All \
		p5-Path-Class>=0:${PORTSDIR}/devel/p5-Path-Class \
		p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception \
		p5-Test-NoWarnings>=0:${PORTSDIR}/devel/p5-Test-NoWarnings \
		p5-Test-Output>=0:${PORTSDIR}/devel/p5-Test-Output \
		p5-Test-Spec>=0:${PORTSDIR}/devel/p5-Test-Spec

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
