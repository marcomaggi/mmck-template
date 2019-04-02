# @configure_input@
#

AC_PREREQ([2.69])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.0])
AC_INIT([MMUX CHICKEN Template],[MMUX_PACKAGE_VERSION],
  [marco.maggi-ipsu@poste.it],
  [mmux-chicken-template],[http://github.com/marcomaggi/mmux-chicken-template])
MMUX_INIT
AC_REVISION([0.1])
AC_COPYRIGHT([Copyright (c) 2019 Marco Maggi <marco.maggi-ipsu@poste.it>

This program is free software: you  can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by
the Free  Software Foundation, either version  3 of the License,  or (at
your option) any later version.

This program  is distributed  in the  hope that it  will be  useful, but
WITHOUT   ANY   WARRANTY;  without   even   the   implied  warranty   of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
])
AC_CONFIG_SRCDIR([lib/])
AC_CONFIG_MACRO_DIR([meta/autotools])
AC_CONFIG_AUX_DIR([meta/autotools])
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([1.16 foreign subdir-objects])
AM_MAINTAINER_MODE

AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P


#### basic system inspection

MMUX_CHECK_TARGET_OS
AX_IS_RELEASE([git-directory])

MMUX_CHICKEN_SCHEME
MMUX_CHICKEN_CHECK_LIBRARY([MMUX_CHECKS],[mmux.checks])

AM_CONDITIONAL([MMUX_TESTING_ENABLED],[test "x$chicken_cv_schemelib_MMUX_CHECKS" = xyes])

AC_CACHE_SAVE


#### external libraries

PKG_PREREQ([0.29])
PKG_INSTALLDIR
MMUX_CHECK_PKG_CONFIG_MACROS

AC_CACHE_SAVE


#### finish

AC_CONFIG_FILES([Makefile]
   [meta/scripts/mmux-chicken-template.pc]
   [meta/slackware/slack-desc]
   [lib/config.scm])
MMUX_OUTPUT
AC_OUTPUT

### end of file
