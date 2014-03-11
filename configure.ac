# Copyright (C) 2014 Robin McCorkell

#This file is part of Karoshi Client.
#
#Karoshi Client is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#Karoshi Client is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with Karoshi Client.  If not, see <http://www.gnu.org/licenses/>.

# Initialise autoconf
AC_INIT([Karoshi Client], [4.0], [rmccorkell@karoshi.org.uk], [karoshi-client], [http://karoshi.org.uk/])
AC_PREREQ([2.61])

# Defines
AC_DEFUN([AX_PATH_PROG_OR_FAIL],
[AC_PATH_PROG([$1], [$2], [no])
if test x"${$1}" == x"no"
then
	AC_MSG_ERROR([Unable to find $2, please install $2])
fi])

AC_DEFUN([AX_FEATURE],
[AC_ARG_ENABLE([$1],
	[AS_HELP_STRING([--disable-$1],
		[disable $2])],
	[],
	[enable_$1=yes])
AM_CONDITIONAL([$3], [test "x${enable_$1}" != xno])])

AC_DEFUN([AX_EXT_DIR],
[AC_ARG_WITH([$1],
	[AS_HELP_STRING([--with-$1=<]translit([$1], [-])[dir>],
		[use <]translit([$1], [-])[dir> for $2 @<:@default=$3@:>@])],
	[],
	[with_]translit([$1], [-], [_])[=$3])
AC_SUBST(translit([$1], [-], [_])[dir], [${with_]translit([$1], [-], [_])[}])])

# Configuration
AC_CONFIG_SRCDIR([src/core/lib/services/update.in])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_FILES([Makefile])

# Initialise automake and libtool
AM_INIT_AUTOMAKE([subdir-objects -Wno-portability])

AC_PROG_MKDIR_P
AC_PROG_SED
AX_PATH_PROG_OR_FAIL([UNZIP], [unzip])

# Features
AX_FEATURE([cups], [CUPS printing support], [CUPS])
AX_FEATURE([firefox], [Mozilla Firefox support], [FIREFOX])
AX_FEATURE([firewall], [iptables configuration support], [FIREWALL])
AX_FEATURE([lightdm], [LightDM configuration], [LIGHTDM])
AX_FEATURE([thunderbird], [Mozilla Thunderbird support], [THUNDERBIRD])
AX_FEATURE([xfce], [XFCE4 configuration], [XFCE])
AX_FEATURE([gvfs], [GVFS tweaks], [GVFS])

# External directories
AX_EXT_DIR([applications], [.desktop files for applications], [${datadir}/applications])
AX_EXT_DIR([icons], [application icons], [${datadir}/pixmaps])
AX_EXT_DIR([sudoers], [sudoers.d files], [${sysconfdir}/sudoers.d])
AX_EXT_DIR([xdg], [XDG data], [${sysconfdir}/xdg])

AX_EXT_DIR([cups-lib], [CUPS files], [${libdir}/cups])
AX_EXT_DIR([lightdm-conf], [LightDM configuration], [${sysconfdir}/lightdm])
AX_EXT_DIR([lightdm-kde-themes], [LightDM KDE greeter themes], [${datadir}/kde4/apps/lightdm-kde-greeter/themes])
AX_EXT_DIR([thunderbird-extensions], [Thunderbird extensions], [${libdir}/mozilla/extensions/{3550f703-e582-4d05-9a08-453d09bdfdc6}])
AX_EXT_DIR([gvfs-lib], [GVFS files], [${libdir}/gvfs])

AC_OUTPUT

