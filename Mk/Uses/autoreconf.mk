# $FreeBSD$
#
# Run autoreconf in CONFIGURE_WRKSRC to update configure, Makefile.in and
# other build scripts.
#
# Autoreconf encapsulates the following commands.  Each command applies to a
# single configure.ac or configure.in (old name).  If configure.ac defines
# subdirectories with their own configure.ac (using AC_CONFIG_SUBDIRS),
# autoreconf will recursively update those as well.
#
# aclocal	Looks up definitions of m4 macros used in configure.ac that are
#		not provided by autoconf and copies them from their source *.m4
#		file to aclocal.m4.  Local *.m4 files included with the source
#		code take precedence over systemwide *.m4 files.
#		Must be run whenever configure.ac or *.m4 files with macros
#		used in configure.ac have been modified.
#		Must also be run whenever automake must be run because the
#		automake macros in aclocal.m4 must have the same version as the
#		automake command.
# autoconf	Generates configure from configure.ac using macro definitions
#		provided by autoconf itself and aclocal.m4.
#		Must be run whenever configure.ac or aclocal.m4 has been
#		modified.
# autoheader	Generates a configuration header (typically config.h.in) from
#		configure.ac and the macro definitions in aclocal.m4.
#		Must be run whenever configure.ac or aclocal.m4 has been
#		modified and configure.ac (or one of the macros it uses)
#		contains AC_CONFIG_HEADERS, AC_CONFIG_HEADER (undocumented) or
#		AM_CONFIG_HEADER (obsolete).
# automake	Generates Makefile.in from Makefile.am for each Makefile
#		specified in configure.ac.  Also updates build scripts like
#		compile, depcomp, install-sh, ylwrap,...
#		Must be run whenever Makefile.am, configure.ac or aclocal.m4
#		has been modified and configure.ac (or one of the macros it
#		uses) contains AM_INIT_AUTOMAKE.
# autopoint	Updates gettext related *.m4 files and build scripts such as
#		config.rpath.
#		If a port uses gettext, this command must be run whenever
#		aclocal must be run such that the gettext macros in aclocal.m4
#		have the same version as the gettext build scripts.
# libtoolize	Updates libtool related *.m4 files and build scripts such as
#		ltmain.sh.
#		If a port uses libtool, this command must be run whenever
#		aclocal must be run such that the libtool macros in aclocal.m4
#		have the same version as the libtool build scripts.
#
# Feature:	autoreconf
# Usage:	USES=autoreconf or USES=autoreconf:args
# Valid args:	build	Don't run autoreconf, only add build dependencies
#
# MAINTAINER:	autotools@FreeBSD.org

.if !defined(_INCLUDE_USES_AUTORECONF_MK)
_INCLUDE_USES_AUTORECONF_MK=	yes
_USES_POST+=	autoreconf

BUILD_DEPENDS+=	autoconf-2.69:${PORTSDIR}/devel/autoconf \
		autoheader-2.69:${PORTSDIR}/devel/autoconf \
		autoreconf-2.69:${PORTSDIR}/devel/autoconf \
		aclocal-1.14:${PORTSDIR}/devel/automake \
		automake-1.14:${PORTSDIR}/devel/automake

.if defined(libtool_ARGS) && empty(libtool_ARGS:Mbuild)
BUILD_DEPENDS+=	libtoolize:${PORTSDIR}/devel/libtool
.endif

.endif

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_AUTORECONF_POST_MK)
_INCLUDE_USES_AUTORECONF_POST_MK=	yes

.if ! ${autoreconf_ARGS:Mbuild}
do-autoreconf:
.for f in AUTHORS ChangeLog INSTALL NEWS README
# Don't modify time stamps if the files already exist
	@test -e ${CONFIGURE_WRKSRC}/${f} || ${TOUCH} ${CONFIGURE_WRKSRC}/${f}
.endfor
	@(cd ${CONFIGURE_WRKSRC} && ${LOCALBASE}/bin/autoreconf -f -i)
.endif

.endif
