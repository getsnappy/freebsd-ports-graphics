# Created by: George Hartzell <hartzell@alerce.com>
# $FreeBSD$

PORTNAME=	CGI-Application-Plugin-HtmlTidy
PORTVERSION=	1.05
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	5u623l20@gmail.com
COMMENT=	Add HTML::Tidy support to CGI::Application

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-CGI-Application>4.01:${PORTSDIR}/www/p5-CGI-Application \
		p5-CGI-Application-Plugin-DevPopup>=0:${PORTSDIR}/www/p5-CGI-Application-Plugin-DevPopup \
		p5-HTML-Tidy>=1.08:${PORTSDIR}/textproc/p5-HTML-Tidy
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
