# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $FreeBSD$
#   $MCom: ports/trunk/sysutils/gnome-control-center/Makefile 20031 2014-11-02 21:47:55Z kwm $

PORTNAME=	gnome-control-center
PORTVERSION=	3.14.2
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Control center for GNOME 3 project

BUILD_DEPENDS=	gnome-settings-daemon>=3.4.0:${PORTSDIR}/sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.2.2:${PORTSDIR}/devel/gsettings-desktop-schemas \
		docbook-xsl>=0:${PORTSDIR}/textproc/docbook-xsl \
		iso-codes>=0:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3 \
		libxklavier.so:${PORTSDIR}/x11/libxklavier \
		libupower-glib.so:${PORTSDIR}/sysutils/upower \
		libaccountsservice.so:${PORTSDIR}/sysutils/accountsservice \
		libcolord.so:${PORTSDIR}/graphics/colord \
		libcolord-gtk.so:${PORTSDIR}/graphics/colord-gtk \
		libibus-1.0.so:${PORTSDIR}/textproc/ibus \
		libgoa-1.0.so:${PORTSDIR}/net/gnome-online-accounts \
		libsocialweb.so:${PORTSDIR}/www/libsocialweb \
		libpwquality.so:${PORTSDIR}/security/libpwquality \
		libgtop-2.0.so:${PORTSDIR}/devel/libgtop \
		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libgrilo-0.2.so:${PORTSDIR}/net/grilo \
		libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit
RUN_DEPENDS=	gnome-eject:${PORTSDIR}/sysutils/gnome-mount \
		gnome-settings-daemon>=3.4.0:${PORTSDIR}/sysutils/gnome-settings-daemon \
		gsettings-desktop-schemas>=3.2.2:${PORTSDIR}/devel/gsettings-desktop-schemas \
		iso-codes>=0:${PORTSDIR}/misc/iso-codes \
		glxinfo:${PORTSDIR}/graphics/mesa-demos \
		apg:${PORTSDIR}/security/apg \
		gcm-calibrate:${PORTSDIR}/graphics/gnome-color-manager

CONFLICTS=	gnome-media-2.[0-9]*

USES=		gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	gnomedesktop3 gnomemenus3 gnomeprefix intlhack libxml2
USE_XORG=	xscrnsaver x11 xxf86misc kbproto xi
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-libsocialweb=yes --disable-systemd
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	CUPS
OPTIONS_DEFAULT=CUPS
CUPS_DESC=	Cups (printing) support
CHEESE_DESC=	Cheese webcam support

OPTIONS_DEFINE_i386=	CHEESE
OPTIONS_DEFAULT_i386=	CHEESE
OPTIONS_DEFINE_amd64=	CHEESE
OPTIONS_DEFAULT_amd64=	CHEESE
CUPS_LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups-client
CUPS_CONFIGURE_ENABLE=	cups	
CHEESE_LIB_DEPENDS=	libcheese.so:${PORTSDIR}/multimedia/cheese
CHEESE_CONFIGUE_WITH=	cheese	

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|datetime wacom|datetime|g' \
		${WRKSRC}/panels/Makefile.in

.include <bsd.port.mk>
