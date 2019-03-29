# cctemplate

[![Build Status](https://travis-ci.org/marcomaggi/mmux-chicken-template.svg?branch=master)](https://travis-ci.org/marcomaggi/mmux-chicken-template)


## Introduction

This is  a template project, to  be used as starting  point for packages
that build and install CHICKEN language libraries.

The library targets POSIX systems.

The package uses the GNU Autotools and it is tested, using Travis CI, on
both Ubuntu GNU+Linux  systems and OS X systems.  The  package relies on
`pkg-config` to find the dependencies installed on the system.

## License

Copyright (c) 2019 Marco Maggi<br/>
`marco.maggi-ipsu@poste.it`<br/>
All rights reserved.

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

## Install

To install from a proper release tarball, do this:

```
$ cd mmux-chicken-template-0.1.0
$ mkdir build
$ cd build
$ ../configure
$ make
$ make check
$ make install
```

to inspect the available configuration options:

```
$ ../configure --help
```

The Makefile is designed to allow parallel builds, so we can do:

```
$ make -j4 all && make -j4 check
```

which,  on  a  4-core  CPU,   should  speed  up  building  and  checking
significantly.

The Makefile supports the DESTDIR  environment variable to install files
in a temporary location, example: to see what will happen:

```
$ make -n install DESTDIR=/tmp/mmux-chicken-template
```

to really do it:

```
$ make install DESTDIR=/tmp/mmux-chicken-template
```

After the  installation it is  possible to verify the  installed library
against the test suite with:

```
$ make installcheck
```

From a repository checkout or snapshot  (the ones from the Github site):
we  must install  the GNU  Autotools  (GNU Automake,  GNU Autoconf,  GNU
Libtool), then  we must first run  the script `autogen.sh` from  the top
source directory, to generate the needed files:

```
$ cd mmux-chicken-template
$ sh autogen.sh

```

After this  the procedure  is the same  as the one  for building  from a
proper release tarball, but we have to enable maintainer mode:

```
$ ../configure --enable-maintainer-mode [options]
$ make
$ make check
$ make install
```

## Usage

Read the documentation generated from  the Texinfo sources.  The package
installs the documentation  in Info format; we can  generate and install
documentation in HTML format by running:

```
$ make html
$ make install-html
```

## Credits

The  stuff was  written by  Marco Maggi.   If this  package exists  it's
because  of the  great GNU  software tools  that he  uses all  the time.
CHICKEN was  originally a creation  of Felix  L.  Winkelmann, it  is now
developed and maintained The CHICKEN Team.

## Bugs, vulnerabilities and contributions

Bug  and vulnerability  reports are  appreciated, all  the vulnerability
reports  are  public; register  them  using  the  Issue Tracker  at  the
project's GitHub  site.  For  contributions and  patches please  use the
Pull Requests feature at the project's GitHub site.

## Resources

The latest release of this package can be downloaded from:

[https://bitbucket.org/marcomaggi/mmux-chicken-template/downloads](https://bitbucket.org/marcomaggi/mmux-chicken-template/downloads)

development takes place at:

[http://github.com/marcomaggi/mmux-chicken-template/](http://github.com/marcomaggi/mmux-chicken-template/)

and as backup at:

[https://bitbucket.org/marcomaggi/mmux-chicken-template/](https://bitbucket.org/marcomaggi/mmux-chicken-template/)

the documentation is available online:

[http://marcomaggi.github.io/docs/mmux-chicken-template.html](http://marcomaggi.github.io/docs/mmux-chicken-template.html)

the GNU Project software can be found here:

[http://www.gnu.org/](http://www.gnu.org/)

we can download CHICKEN from:

[http://www.call-cc.org/](http://www.call-cc.org/)

## Badges and static analysis

### Travis CI

Travis CI is  a hosted, distributed continuous  integration service used
to build and test software projects  hosted at GitHub.  We can find this
project's dashboard at:

[https://travis-ci.org/marcomaggi/mmux-chicken-template](https://travis-ci.org/marcomaggi/mmux-chicken-template)

Usage of this  service is configured through the  file `.travis.yml` and
additional scripts are under the directory `meta/travis-ci`.

