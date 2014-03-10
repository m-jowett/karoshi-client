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

AC_DEFUN([AX_PATH_PROG_OR_FAIL],
[AC_PATH_PROG([$1], [$2], [no])
if test x"${$1}" == x"no"
then
	AC_MSG_ERROR([Unable to find $2, please install $2])
fi])

# Configuration
AC_CONFIG_SRCDIR([src/core/lib/services/update.in])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_FILES([Makefile])

# Initialise automake and libtool
AM_INIT_AUTOMAKE([subdir-objects -Wno-portability])

AC_PROG_MKDIR_P
AC_PROG_SED
AX_PATH_PROG_OR_FAIL([UNZIP], [unzip])

AC_OUTPUT

