dnl mmux-chicken-scheme.m4 --
dnl
dnl Finds Chicken Scheme with compiler executable installed as "csc".

AC_DEFUN([MMUX_CHICKEN_SCHEME],
  [AC_PATH_PROG([CHICKEN_COMPILER],[csc],[:])
   AC_PATH_PROG([CHICKEN_INTERPRETER],[csi],[:])

   # Determine where shared libraries should be installed.
   #
   AS_VAR_SET(MMUX_CHICKEN_LIBDIR,[${libdir}/chicken/9])
   AC_MSG_NOTICE([CHICKEN libraries will be installed under: $MMUX_CHICKEN_LIBDIR])
   AC_SUBST([MMUX_CHICKEN_LIBDIR])
   ])

# Set version numbers for libraries built with CHICKEN.
#
#   MMUX_CHICKEN_LIBRARY_VERSIONS(stem,current,revision,age)
#
AC_DEFUN([MMUX_CHICKEN_LIBRARY_VERSIONS],
  [AS_VAR_SET([$1_VERSION_INTERFACE_CURRENT],[$2])
   AS_VAR_SET([$1_VERSION_INTERFACE_REVISION],[$3])
   AS_VAR_SET([$1_VERSION_INTERFACE_AGE],[$4])
   AS_VAR_SET([$1_VERSION_INTERFACE_STRING],["$$1_VERSION_INTERFACE_CURRENT.$$1_VERSION_INTERFACE_REVISION"])
   AC_SUBST([$1_VERSION_INTERFACE_CURRENT])
   AC_SUBST([$1_VERSION_INTERFACE_REVISION])
   AC_SUBST([$1_VERSION_INTERFACE_AGE])
   AC_SUBST([$1_VERSION_INTERFACE_STRING])])

dnl end of file
dnl Local Variables:
dnl mode: autoconf
dnl End:
