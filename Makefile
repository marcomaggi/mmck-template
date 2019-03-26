# Makefile --

AM_CHICKEN_FLAGS	= -I.
AM_CHICKEN_LDFLAGS	= -L.

CSC			= csc
CSC_COMPILE_OBJECT	= $(CSC) $(AM_CHICKEN_FLAGS) $(CHICKEN_FLAGS) -c -o
CSC_LINK_LIBRARY	= $(CSC) -library -shared $(AM_CHICKEN_LDFLAGS) $(CHICKEN_LDFLAGS) -o

TARGETS		= \
	library-for-expand.so library-for-expand.import.so \
	library-alpha.so library-alpha.import.so \
	library-beta.so \
	program-using-alpha program-using-beta

CLEANFILES	= *.so *import.* *.o

## --------------------------------------------------------------------

.PHONY: all clean

all: $(TARGETS)

clean:
	rm -f $(CLEANFILES)

## --------------------------------------------------------------------

module-for-expand.o module-for-expand.import.scm: module-for-expand.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

module-for-expand.import.o: module-for-expand.import.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

library-for-expand.so: module-for-expand.o
	$(CSC_LINK_LIBRARY) $(@) $(<)

library-for-expand.import.so: module-for-expand.import.scm
	$(CSC_LINK_LIBRARY) $(@) $(<)

## --------------------------------------------------------------------

module-alpha.o module-alpha.import.scm: module-alpha.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

module-alpha.import.o: module-alpha.import.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

library-alpha.so: module-alpha.o library-for-expand.import.so
	$(CSC_LINK_LIBRARY) $(@) $(<) -link library-for-expand

library-alpha.import.so: module-alpha.import.o
	$(CSC_LINK_LIBRARY) $(@) $(<) -link library-for-expand

## --------------------------------------------------------------------

module-beta-one.o module-beta-one.import.scm: module-beta-one.scm library-alpha.import.so
	$(CSC_COMPILE_OBJECT) $(@) $(<)

module-beta-two.o module-beta-two.import.scm: module-beta-two.scm library-alpha.import.so
	$(CSC_COMPILE_OBJECT) $(@) $(<)

module-beta-one.import.o: module-beta-one.import.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

module-beta-two.import.o: module-beta-two.import.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

library-beta.so: module-beta-one.o module-beta-two.o
	$(CSC_LINK_LIBRARY) $(@) $(^) -link library-alpha

library-beta.import.so: module-beta-one.import.o module-beta-two.import.o
	$(CSC_LINK_LIBRARY) $(@) $(^) -link library-alpha

## --------------------------------------------------------------------

program-using-alpha.o: program-using-alpha.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

program-using-alpha: program-using-alpha.o library-alpha.so
	$(CSC_LINK_PROGRAM) $(@) $(<) -link library-alpha

## --------------------------------------------------------------------

program-using-beta.o: program-using-beta.scm
	$(CSC_COMPILE_OBJECT) $(@) $(<)

program-using-beta: program-using-beta.o library-beta.so
	$(CSC_LINK_PROGRAM) $(@) $(<) -link library-beta

### end of file
