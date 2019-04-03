## Process this file with automake to produce Makefile.in

include meta/automake/mmux-chicken-rules.make

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-chicken-template.pc


#### documentation

info_TEXINFOS		= doc/mmux-chicken-template.texi
doc_mmux_chicken_template_TEXINFOS = \
	doc/macros.texi			\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi


#### library build targets

# All the source files of the extension library.
#
MMUX_TEMPLATE_MODULES		= \
	lib/mmux.template.alpha.scm		\
	lib/mmux.template.version.scm		\
	lib/mmux.template.scm

# All the object files that must be linked in the extension library.
#
MMUX_TEMPLATE_RUNTIME_OBJECTS	= \
	lib/mmux.template.alpha.$(OBJEXT)	\
	lib/mmux.template.version.$(OBJEXT)	\
	lib/mmux.template.$(OBJEXT)

# All the source files of all the modules' import libraries.
#
MMUX_TEMPLATE_IMPORT_SOURCES	= \
	lib/mmux.template.alpha.import.scm	\
	lib/mmux.template.version.import.scm	\
	lib/mmux.template.import.scm

# The module's import libraries needed to compile main module's object
# file.  It does not include the main import library:
#
#   lib/mmux.template.import.$(MMUX_SOEXT)
#
MMUX_TEMPLATE_IMPORT_DEPS	= \
	lib/mmux.template.alpha.import.$(MMUX_SOEXT)	\
	lib/mmux.template.version.import.$(MMUX_SOEXT)

# The import  libraries needed  to compile new  code using  the shared
# library  "(mmux template)".   We need  to build  and install  all of
# them.
#
MMUX_TEMPLATE_IMPORT_SHARED_LIBS	= \
	lib/mmux.template.alpha.import.$(MMUX_SOEXT)	\
	lib/mmux.template.version.import.$(MMUX_SOEXT)	\
	lib/mmux.template.import.$(MMUX_SOEXT)

# This is the "(mmux template)" shared library file pathname.
#
MMUX_TEMPLATE_RUNTIME_SHARED_LIBS	= lib/mmux.template.$(MMUX_SOEXT)

## --------------------------------------------------------------------

EXTRA_DIST	+= $(MMUX_TEMPLATE_MODULES)

CLEANFILES	+= \
	$(MMUX_TEMPLATE_RUNTIME_SHARED_LIBS)	\
	$(MMUX_TEMPLATE_RUNTIME_OBJECTS)	\
	$(MMUX_TEMPLATE_IMPORT_SHARED_LIBS)	\
	$(MMUX_TEMPLATE_IMPORT_SOURCES)

## --------------------------------------------------------------------

lib/mmux.template.version.$(OBJEXT): lib/mmux.template.version.scm $(MMUX_OBJECTS_DEPS)
	$(MMUX_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<) -prologue lib/config.scm
	@$(MV) mmux.template.version.import.scm lib/mmux.template.version.import.scm

lib/mmux.template.version.import.scm: lib/mmux.template.version.$(OBJEXT)

lib/mmux.template.version.import.$(MMUX_SOEXT): lib/mmux.template.version.import.scm
	$(MMUX_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

lib/mmux.template.alpha.$(OBJEXT): lib/mmux.template.alpha.scm $(MMUX_OBJECTS_DEPS)
	$(MMUX_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@$(MV) mmux.template.alpha.import.scm lib/mmux.template.alpha.import.scm

lib/mmux.template.alpha.import.scm: lib/mmux.template.alpha.$(OBJEXT)

lib/mmux.template.alpha.import.$(MMUX_SOEXT): lib/mmux.template.alpha.import.scm
	$(MMUX_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

# This is the main compilation unit and it defines the main module; it
# depends upon all the import libraries of the other modules.
#
lib/mmux.template.$(OBJEXT): lib/mmux.template.scm $(MMUX_TEMPLATE_IMPORT_DEPS) $(MMUX_OBJECTS_DEPS)
	$(MMUX_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@$(MV) mmux.template.import.scm lib/mmux.template.import.scm

lib/mmux.template.import.scm: lib/mmux.template.$(OBJEXT)

lib/mmux.template.import.$(MMUX_SOEXT): lib/mmux.template.import.scm
	$(MMUX_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

lib/mmux.template.$(MMUX_SOEXT): $(MMUX_TEMPLATE_RUNTIME_OBJECTS)
	$(MMUX_LIB_ENV) $(CSC_LINK_LIBRARY) $(@) $(^)


#### shared libraries installation

# All the import shared libraries that we want to installe.
#
MMUX_ALL_IMPORT_SHARED_LIBS	= \
	$(MMUX_TEMPLATE_IMPORT_SHARED_LIBS)

# All the runtime shared libraries that we want to install.
#
MMUX_ALL_RUNTIME_SHARED_LIBS	= \
	$(MMUX_TEMPLATE_RUNTIME_SHARED_LIBS)

# These variables are parsed by GNU Automake to build the main library
# targets and install them under the directory $(MMUX_CHICKEN_LIBDIR).
#
# We are shamelessly cheating by  installing them using GNU Automake's
# primary  suffix  "_SCRIPTS"; these  are  not  scripts!  Scripts  are
# installed with the permissions 0755, which, for some reason, is what
# we want  for shared libraries.
#
# We  could use  the  primary suffix  "_DATA", but  we  would get  the
# permissions 0644.
#
sharedlibdir		= $(MMUX_CHICKEN_LIBDIR)
sharedlib_SCRIPTS	= $(MMUX_ALL_RUNTIME_SHARED_LIBS) $(MMUX_ALL_IMPORT_SHARED_LIBS)


#### interface to "make check"
#
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#

EXTRA_DIST		+= \
	tests/test-version.scm		\
	tests/test-alpha.scm

MMUX_CHECK_OBJECTS	= \
	tests/test-version.$(OBJEXT)	\
	tests/test-alpha.$(OBJEXT)

MMUX_CHECK_PROGS	= \
	tests/test-version.exe		\
	tests/test-alpha.exe

CLEANFILES	+= $(MMUX_CHECK_PROGS) $(MMUX_CHECK_OBJECTS)

if MMUX_TESTING_ENABLED
TESTS		= $(MMUX_CHECK_PROGS)
endif

MMUX_CHECK_DEPS	+= $(MMUX_TEMPLATE_LIBRARY) $(MMUX_ALL_IMPORT_LIBS)

## --------------------------------------------------------------------

tests/test-version.$(OBJEXT): tests/test-version.scm $(MMUX_CHECK_DEPS)
	$(MMUX_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-version.exe: tests/test-version.$(OBJEXT)
	$(MMUX_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

## --------------------------------------------------------------------

tests/test-alpha.$(OBJEXT): tests/test-alpha.scm $(MMUX_CHECK_DEPS)
	$(MMUX_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-alpha.exe: tests/test-alpha.$(OBJEXT)
	$(MMUX_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

### end of file
