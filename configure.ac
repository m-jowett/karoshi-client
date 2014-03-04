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

# Configuration
AC_CONFIG_SRCDIR([src/core/lib/services/update])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_FILES([Makefile]
	[src/xfce4/applications/Makefile src/xfce4/lib/Makefile src/xfce4/xdg/Makefile src/xfce4/data/Makefile]
	[src/xfce4/bin/Makefile src/xfce4/gvfs/Makefile src/xfce4/Makefile]
	[src/firewall/lib/Makefile src/firewall/bin/Makefile src/firewall/Makefile]
	[src/thunderbird/lib/Makefile src/thunderbird/extensions/Makefile src/thunderbird/Makefile]
	[src/lightdm/themes/Makefile src/lightdm/config/Makefile src/lightdm/Makefile]
	[src/core/applications/Makefile src/core/icons/Makefile src/core/lib/Makefile src/core/config/Makefile]
	[src/core/data/Makefile src/core/bin/Makefile src/core/Makefile]
	[src/cups/sudoers.d/Makefile src/cups/backend/Makefile src/cups/lib/Makefile src/cups/Makefile]
	[src/firefox/lib/Makefile src/firefox/Makefile])

# Initialise automake and libtool
AM_INIT_AUTOMAKE([subdir-objects])

AC_PROG_INSTALL
AC_PROG_MKDIR_P

AC_OUTPUT

