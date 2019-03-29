## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL meta/slackware/slack-desc.in
dist_doc_DATA		= README COPYING

MAINTAINERCLEANFILES	= lib/config.scm
CLEANFILES		=

OBJEXT			= o

# This is the extension of the shared object libraries.
#
if ON_LINUX
MMUX_SOEXT		= so
endif
if ON_BSD
MMUX_SOEXT		= so
endif
if ON_CYGWIN
MMUX_SOEXT		= dll
endif
if ON_DARWIN
MMUX_SOEXT		= dylib
endif

MV			= mv --verbose

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-chicken-template.pc


#### documentation

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-chicken-template.texi
doc_mmux_chicken_template_TEXINFOS = \
	doc/macros.texi			\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi


#### CHICKEN compiler command lines and flags

# Included   in   every   compiler   command   line.    The   variable
# "CHICKEN_FLAGS" is available  for the user to be set  on the command
# line of "make":
#
#   $ make CHICKEN_FLAGS=...
#
AM_CHICKEN_FLAGS		= $(CHICKEN_FLAGS)

# Included in every compiler command line used to compile object files
# for a shared library.
#
AM_CHICKEN_FLAGS_OBJECT_SHARED	= -dynamic $(AM_CHICKEN_FLAGS)

# Included in every compiler command line used to compile object files
# for a program.
#
AM_CHICKEN_FLAGS_OBJECT_STATIC	= $(AM_CHICKEN_FLAGS)

## --------------------------------------------------------------------

# Included in every compiler command line used to link object files in
# a shared library.  The  variable "CHICKEN_LIBFLAGS" is available for
# the user to be set on the command line of "make":
#
#   $ make CHICKEN_LIBFLAGS=...
#
AM_CHICKEN_LIBFLAGS	= -library $(AM_CHICKEN_FLAGS) $(CHICKEN_LIBFLAGS)

# Included in every compiler command line used to link object files in
# a program.   The variable  "CHICKEN_PROGFLAGS" is available  for the
# user to be set on the command line of "make":
#
#   $ make CHICKEN_PROGFLAGS=...
#
AM_CHICKEN_PROGFLAGS	= $(AM_CHICKEN_FLAGS) $(CHICKEN_PROGFLAGS)

## --------------------------------------------------------------------

# Compile an object file to be used in a shared library.
#
CSC_COMPILE_OBJECT_SHARED	= $(CHICKEN_COMPILER) $(AM_CHICKEN_FLAGS_OBJECT_SHARED) -c -o

# Compile an object file to be used in a program.
#
CSC_COMPILE_OBJECT_STATIC	= $(CHICKEN_COMPILER) $(AM_CHICKEN_FLAGS_OBJECT_STATIC) -c -o

# Compile object files into a shared  library.  We use this for import
# libraries.
#
CSC_COMPILE_LIBRARY		= $(CHICKEN_COMPILER) -dynamic $(AM_CHICKEN_LIBFLAGS) -o

# Link object files into a shared library.
#
CSC_LINK_LIBRARY		= $(CHICKEN_COMPILER) $(AM_CHICKEN_LIBFLAGS) -o

# Link object files into a program.
#
CSC_LINK_PROGRAM		= $(CHICKEN_COMPILER) $(AM_CHICKEN_PROGFLAGS) -o


#### build targets

MMUX_LIB_REPOSITORY_PATH	= $(abs_builddir)/lib:$(CHICKEN_REPOSITORY_PATH)

MMUX_LIB_ENV			= \
	CHICKEN_REPOSITORY_PATH=$(MMUX_LIB_REPOSITORY_PATH); export CHICKEN_REPOSITORY_PATH;

## --------------------------------------------------------------------

MMUX_TEMPLATE_OBJECTS_DEPS	= lib/$(am__dirstamp)

MMUX_TEMPLATE_MODULES		= \
	lib/mmux-chicken-template-alpha.scm		\
	lib/mmux-chicken-template-version.scm

MMUX_TEMPLATE_OBJECTS		= \
	lib/mmux-chicken-template-alpha.$(OBJEXT)	\
	lib/mmux-chicken-template-version.$(OBJEXT)

MMUX_TEMPLATE_IMPORT_SOURCES	= \
	lib/mmux-chicken-template-alpha.import.scm	\
	lib/mmux-chicken-template-version.import.scm

MMUX_TEMPLATE_IMPORT_LIBS	= \
	lib/mmux-chicken-template-alpha.import.$(MMUX_SOEXT)	\
	lib/mmux-chicken-template-version.import.$(MMUX_SOEXT)

MMUX_TEMPLATE_LIBRARY	= lib/mmux-chicken-template.$(MMUX_SOEXT)

CLEANFILES		+= \
	$(MMUX_TEMPLATE_LIBRARY)	\
	$(MMUX_TEMPLATE_OBJECTS)	\
	$(MMUX_TEMPLATE_IMPORT_SOURCES)	\
	$(MMUX_TEMPLATE_IMPORT_LIBS)

## --------------------------------------------------------------------

all: $(MMUX_TEMPLATE_LIBRARY) $(MMUX_TEMPLATE_IMPORT_LIBS)

## --------------------------------------------------------------------

lib/$(am__dirstamp):
	@$(MKDIR_P) lib
	@: > lib/$(am__dirstamp)

## --------------------------------------------------------------------

lib/mmux-chicken-template-version.$(OBJEXT): lib/mmux-chicken-template-version.scm $(MMUX_TEMPLATE_OBJECTS_DEPS)
	$(MMUX_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<) -prologue lib/config.scm
	@$(MV) mmux-chicken-template-version.import.scm lib/mmux-chicken-template-version.import.scm
	@echo

lib/mmux-chicken-template-version.import.scm: lib/mmux-chicken-template-version.$(OBJEXT)

lib/mmux-chicken-template-version.import.$(MMUX_SOEXT): lib/mmux-chicken-template-version.import.scm
	$(MMUX_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

lib/mmux-chicken-template-alpha.$(OBJEXT): lib/mmux-chicken-template-alpha.scm $(MMUX_TEMPLATE_OBJECTS_DEPS)
	$(MMUX_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@$(MV) mmux-chicken-template-alpha.import.scm lib/mmux-chicken-template-alpha.import.scm
	@echo

lib/mmux-chicken-template-alpha.import.scm: lib/mmux-chicken-template-alpha.$(OBJEXT)

lib/mmux-chicken-template-alpha.import.$(MMUX_SOEXT): lib/mmux-chicken-template-alpha.import.scm
	$(MMUX_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

lib/mmux-chicken-template.$(MMUX_SOEXT): $(MMUX_TEMPLATE_OBJECTS)
	$(MMUX_LIB_ENV) $(CSC_LINK_LIBRARY) $(@) $(^)
	@echo


#### interface to "make check"
#
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#

MMUX_CHECK_REPOSITORY_PATH	= $(abs_builddir)/lib:$(CHICKEN_REPOSITORY_PATH)
MMUX_CHECK_LD_PATH		= $(builddir)/lib:$(LD_LIBRARY_PATH)
MMUX_CHECK_DYLD_PATH		= $(builddir)/lib:$(DYLD_LIBRARY_PATH)
MMUX_CHECK_SOURCE_PATH		= $(srcdir)/tests:$(srcdir)/lib

# Let's make  sure the  compiler and  the test  programs can  find the
# libraries built by this package.
#
MMUX_CHECK_ENV			= \
	LD_LIBRARY_PATH=$(MMUX_CHECK_LD_PATH);			export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(MMUX_CHECK_DYLD_PATH);		export DYLD_LIBRARY_PATH;	\
	CHICKEN_REPOSITORY_PATH=$(MMUX_CHECK_REPOSITORY_PATH);	export CHICKEN_REPOSITORY_PATH;

# We want  to hand  some environment variables  to the  test programs,
# both at expand-time and at run-time.
#
MMUX_CHECK_ENV			+= \
	MMUX_CHECK_QUIET=yes;				export MMUX_CHECK_QUIET;	\
	MMUX_SOURCE_PATH=$(MMUX_CHECK_SOURCE_PATH);	export MMUX_SOURCE_PATH;	\
	CHECK_TEST_NAME=$(name);			export CHECK_TEST_NAME;		\
	MMUX_SRCDIR=$(srcdir)/tests;			export MMUX_SRCDIR;		\
	MMUX_BUILDDIR=$(builddir);			export MMUX_BUILDDIR;

## --------------------------------------------------------------------

MMUX_CHECK_PROGS	= \
	tests/test-version

MMUX_CHECK_OBJECTS	= \
	tests/test-version.$(OBJEXT)

CLEANFILES		+= $(MMUX_CHECK_OBJECTS)

check_PROGRAMS		= $(MMUX_CHECK_PROGS)
if MMUX_TESTING_ENABLED
TESTS			= $(check_PROGRAMS)
endif
AM_TESTS_ENVIRONMENT	= $(MMUX_CHECK_ENV)

MMUX_TEMPLATE_CHECK_DEPS= $(MMUX_TEMPLATE_LIBRARY) $(MMUX_TEMPLATE_IMPORT_LIBS) tests/$(am__dirstamp)

## --------------------------------------------------------------------

tests_test_version_SOURCES	= tests/test-version.scm

tests/test-version.$(OBJEXT): tests/test-version.scm $(MMUX_TEMPLATE_CHECK_DEPS)
	$(MMUX_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

tests/test-version$(EXEEXT): tests/test-version.$(OBJEXT)
	$(MMUX_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)
	@echo


#### interface to "make instcheck"

MMUX_INSTALLCHECK_REPOSITORY_PATH	= $(CHICKEN_REPOSITORY_PATH)
MMUX_INSTALLCHECK_LD_PATH		= $(DESTDIR)$(MMUX_CHICKEN_LIBDIR):$(LD_LIBRARY_PATH)
MMUX_INSTALLCHECK_DYLD_PATH		= $(DESTDIR)$(MMUX_CHICKEN_LIBDIR):$(DYLD_LIBRARY_PATH)

# Let's make  sure the  compiler and  the test  programs can  find the
# libraries built by this package.
#
MMUX_INSTALLCHECK_ENV			= \
	LD_LIBRARY_PATH=$(MMUX_INSTALLCHECK_LD_PATH);			export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(MMUX_INSTALLCHECK_DYLD_PATH);		export DYLD_LIBRARY_PATH;	\
	CHICKEN_REPOSITORY_PATH=$(MMUX_INSTALLCHECK_REPOSITORY_PATH);	export CHICKEN_REPOSITORY_PATH;

# We want  to hand  some environment variables  to the  test programs,
# both at expand-time and at run-time.
#
MMUX_INSTALLCHECK_ENV			+= \
	MMUX_CHECK_QUIET=yes;				export MMUX_INSTALLCHECK_QUIET;	\
	MMUX_SOURCE_PATH=$(MMUX_CHECK_SOURCE_PATH);	export MMUX_SOURCE_PATH;	\
	CHECK_TEST_NAME=$(name);			export CHECK_TEST_NAME;		\
	MMUX_SRCDIR=$(srcdir)/tests;			export MMUX_SRCDIR;		\
	MMUX_BUILDDIR=$(builddir);			export MMUX_BUILDDIR;

installcheck-local: $(TESTS)
	@for f in $(TESTS); do $(builddir)/$$f; done


#### running the interpreter and the tests

.PHONY: repl test tests

repl:
	$(MMUX_CHECK_ENV) $(CHICKEN_INTERPRETER)

test tests:
	for f in $(builddir)/tests/test-*$(file); do $(MMUX_CHECK_ENV) $$f; done


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
