## Process this file with automake to produce Makefile.in

include meta/automake/mmck-rules.make

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmck-template.pc


#### documentation

info_TEXINFOS		= doc/mmck-template.texi
doc_mmck_template_TEXINFOS = \
	doc/macros.texi			\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi


#### library build targets

# All the source files of the extension library.
#
MMCK_TEMPLATE_MODULES		= \
	lib/mmck.template.alpha.scm		\
	lib/mmck.template.version.scm		\
	lib/mmck.template.scm

# All the object files that must be linked in the extension library.
#
MMCK_TEMPLATE_RUNTIME_OBJECTS	= \
	lib/mmck.template.alpha.$(OBJEXT)	\
	lib/mmck.template.version.$(OBJEXT)	\
	lib/mmck.template.$(OBJEXT)

# All the source files of all the modules' import libraries.
#
MMCK_TEMPLATE_IMPORT_SOURCES	= \
	lib/mmck.template.alpha.import.scm	\
	lib/mmck.template.version.import.scm	\
	lib/mmck.template.import.scm

# The module's import libraries needed to compile main module's object
# file.  It does not include the main import library:
#
#   lib/mmck.template.import.$(MMCK_SOEXT)
#
MMCK_TEMPLATE_IMPORT_DEPS	= \
	lib/mmck.template.alpha.import.$(MMCK_SOEXT)	\
	lib/mmck.template.version.import.$(MMCK_SOEXT)

# The import  libraries needed  to compile new  code using  the shared
# library  "(mmck template)".   We need  to build  and install  all of
# them.
#
MMCK_TEMPLATE_IMPORT_SHARED_LIBS	= \
	lib/mmck.template.alpha.import.$(MMCK_SOEXT)	\
	lib/mmck.template.version.import.$(MMCK_SOEXT)	\
	lib/mmck.template.import.$(MMCK_SOEXT)

# This is the "(mmck template)" shared library file pathname.
#
MMCK_TEMPLATE_RUNTIME_SHARED_LIBS	= lib/mmck.template.$(MMCK_SOEXT)

MMCK_TEMPLATE_TEMP_FILES	= \
	lib/mmck.template.version.temp			\
	lib/mmck.template.alpha.temp			\
	lib/mmck.template.temp				\
	\
	lib/mmck.template.version.lock			\
	lib/mmck.template.alpha.lock			\
	lib/mmck.template.lock				\
	\
	lib/mmck.template.version.stamp			\
	lib/mmck.template.alpha.stamp			\
	lib/mmck.template.stamp

## --------------------------------------------------------------------

EXTRA_DIST	+= $(MMCK_TEMPLATE_MODULES)

CLEANFILES	+= \
	$(MMCK_TEMPLATE_RUNTIME_SHARED_LIBS)	\
	$(MMCK_TEMPLATE_RUNTIME_OBJECTS)	\
	$(MMCK_TEMPLATE_IMPORT_SHARED_LIBS)	\
	$(MMCK_TEMPLATE_IMPORT_SOURCES)		\
	$(MMCK_TEMPLATE_TEMP_FILES)

## --------------------------------------------------------------------

# A compiler  invokation to build  an object file, also  generates the
# source  file for  the import  library; a  single rule  generates two
# targets.  We implement  the rules as suggested  in the documentation
# of GNU Automake, node "Multiple Outputs".
#
# It is ugly, I know.  But it  is supposed to support all the cases of
# parallel build and dry runs.  (Marco Maggi; May  4, 2019)
#
lib/mmck.template.version.stamp: lib/mmck.template.version.scm $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.template.version.temp
	@touch lib/mmck.template.version.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.template.version.$(OBJEXT) $(<) -prologue lib/config.scm
	@$(MV) mmck.template.version.import.scm lib/mmck.template.version.import.scm
	@mv -f lib/mmck.template.version.temp $@

lib/mmck.template.version.import.scm lib/mmck.template.version.$(OBJEXT): lib/mmck.template.version.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.template.version.lock lib/mmck.template.version.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.template.version.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.template.version.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.template.version.stamp; \
	    $$dry rmdir lib/mmck.template.version.lock; \
	  else \
	    while test -d lib/mmck.template.version.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.template.version.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.template.version.import.$(MMCK_SOEXT): lib/mmck.template.version.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

lib/mmck.template.alpha.stamp: lib/mmck.template.alpha.scm $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.template.alpha.temp
	@touch lib/mmck.template.alpha.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.template.alpha.$(OBJEXT) $(<)
	@$(MV) mmck.template.alpha.import.scm lib/mmck.template.alpha.import.scm
	@mv -f lib/mmck.template.alpha.temp $@

lib/mmck.template.alpha.import.scm lib/mmck.template.alpha.$(OBJEXT): lib/mmck.template.alpha.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.template.alpha.lock lib/mmck.template.alpha.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.template.alpha.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.template.alpha.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.template.alpha.stamp; \
	    $$dry rmdir lib/mmck.template.alpha.lock; \
	  else \
	    while test -d lib/mmck.template.alpha.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.template.alpha.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.template.alpha.import.$(MMCK_SOEXT): lib/mmck.template.alpha.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

# This is the main compilation unit and it defines the main module; it
# depends upon all the import libraries of the other modules.
#
lib/mmck.template.stamp: lib/mmck.template.scm $(MMCK_TEMPLATE_IMPORT_DEPS) $(MMCK_OBJECTS_DEPS)
	@rm -f lib/mmck.template.temp
	@touch lib/mmck.template.temp
	$(MMCK_LIB_ENV) $(CSC_COMPILE_OBJECT_SHARED) lib/mmck.template.$(OBJEXT) $(<)
	@$(MV) mmck.template.import.scm lib/mmck.template.import.scm
	@mv -f lib/mmck.template.temp $@

lib/mmck.template.import.scm lib/mmck.template.$(OBJEXT): lib/mmck.template.stamp
	@dry=; for f in x $$MAKEFLAGS; do \
	  case $$f in \
	    *=*|--*);; \
	    *n*) dry=:;; \
	  esac; \
	done; \
	if test -f $@; then :; else \
	  $$dry trap 'rm -rf lib/mmck.template.lock lib/mmck.template.stamp' 1 2 13 15; \
	  if $$dry mkdir lib/mmck.template.lock 2>/dev/null; then \
	    $$dry rm -f lib/mmck.template.stamp; \
	    $(MAKE) $(AM_MAKEFLAGS) lib/mmck.template.stamp; \
	    $$dry rmdir lib/mmck.template.lock; \
	  else \
	    while test -d lib/mmck.template.lock && test -z "$$dry"; do \
	      sleep 1; \
	    done; \
	    $$dry test -f lib/mmck.template.stamp; exit $$?; \
	  fi; \
	fi

lib/mmck.template.import.$(MMCK_SOEXT): lib/mmck.template.import.scm
	$(MMCK_LIB_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

lib/mmck.template.$(MMCK_SOEXT): $(MMCK_TEMPLATE_RUNTIME_OBJECTS)
	$(MMCK_LIB_ENV) $(CSC_LINK_LIBRARY) $(@) $(^)


#### shared libraries installation

# All the import shared libraries that we want to installe.
#
MMCK_ALL_IMPORT_SHARED_LIBS	= \
	$(MMCK_TEMPLATE_IMPORT_SHARED_LIBS)

# All the runtime shared libraries that we want to install.
#
MMCK_ALL_RUNTIME_SHARED_LIBS	= \
	$(MMCK_TEMPLATE_RUNTIME_SHARED_LIBS)

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
sharedlib_SCRIPTS	= $(MMCK_ALL_RUNTIME_SHARED_LIBS) $(MMCK_ALL_IMPORT_SHARED_LIBS)


#### interface to "make check"
#
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#

EXTRA_DIST		+= \
	tests/test-version.scm		\
	tests/test-alpha.scm

MMCK_CHECK_OBJECTS	= \
	tests/test-version.$(OBJEXT)	\
	tests/test-alpha.$(OBJEXT)

MMCK_CHECK_PROGS	= \
	tests/test-version.exe		\
	tests/test-alpha.exe

CLEANFILES	+= $(MMCK_CHECK_PROGS) $(MMCK_CHECK_OBJECTS)

if MMCK_TESTING_ENABLED
TESTS		= $(MMCK_CHECK_PROGS)
endif

MMCK_CHECK_DEPS	+= $(MMCK_ALL_RUNTIME_SHARED_LIBS) $(MMCK_ALL_IMPORT_LIBS)

## --------------------------------------------------------------------

tests/test-version.$(OBJEXT): tests/test-version.scm $(MMCK_CHECK_DEPS)
	$(MMCK_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-version.exe: tests/test-version.$(OBJEXT)
	$(MMCK_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

## --------------------------------------------------------------------

tests/test-alpha.$(OBJEXT): tests/test-alpha.scm $(MMCK_CHECK_DEPS)
	$(MMCK_CHECK_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)

tests/test-alpha.exe: tests/test-alpha.$(OBJEXT)
	$(MMCK_CHECK_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)

### end of file
