#
# SYNOPSIS
#
#   MMUX_SPLIT_VERSION(STEM,VERSION_NUMBER)
#
# DESCRIPTION
#
#   Split  a version  number in  the format  MAJOR.MINOR.POINT into  its
#   separate components.
#
#   Set the variables:
#
#      ${STEM}_MAJOR_VERSION
#      ${STEM}_MINOR_VERSION
#      ${STEM}_PATCH_VERSION
#
#   This macro is derived from AX_SPLIT_VERSION, which we can find at:
#
#     https://www.gnu.org/software/autoconf-archive/ax_split_version.html
#
# LICENSE
#
#   Copyright (c) 2019 Marco Maggi <marco.maggi-ipsu@poste.it>
#   Copyright (c) 2008 Tom Howard <tomhoward@users.sf.net>
#
#   Copying and distribution of this file, with or without modification,
#   are permitted in  any medium without royalty  provided the copyright
#   notice and  this notice are  preserved. This file is  offered as-is,
#   without any warranty.

#serial 10

AC_DEFUN([MMUX_SPLIT_VERSION],[
    AC_REQUIRE([AC_PROG_SED])
    AS_VAR_PUSHDEF([MMUX_AX_SPLIT_VERSION_INPUT],[$2])
    AS_VAR_SET($1_MAJOR_VERSION,[`echo "$MMUX_AX_SPLIT_VERSION" | "$SED" 's/\([[^.]][[^.]]*\).*/\1/'`])
    AS_VAR_SET($1_MINOR_VERSION,[`echo "$MMUX_AX_SPLIT_VERSION" | "$SED" 's/[[^.]][[^.]]*.\([[^.]][[^.]]*\).*/\1/'`])
    AS_VAR_SET($1_PATCH_VERSION,[`echo "$MMUX_AX_SPLIT_VERSION" | "$SED" 's/[[^.]][[^.]]*.[[^.]][[^.]]*.\(.*\)/\1/'`])
    AS_VAR_POPDEF([MMUX_AX_SPLIT_VERSION_INPUT])
])

### end of file
# Local Variables:
# mode: autoconf
# End:
