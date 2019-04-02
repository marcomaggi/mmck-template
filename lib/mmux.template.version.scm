;;; -*- coding: utf-8-unix  -*-
;;;
;;;Part of: MMUX CHICKEN Template
;;;Contents: version functions
;;;Date: Fri Mar 29, 2019
;;;
;;;Abstract
;;;
;;;	This unit defines version functions.
;;;
;;;Copyright (C) 2019 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software: you can  redistribute it and/or modify it under the
;;;terms of the GNU  Lesser General Public License as published  by the Free Software
;;;Foundation,  either version  3  of the  License,  or (at  your  option) any  later
;;;version.
;;;
;;;This program is  distributed in the hope  that it will be useful,  but WITHOUT ANY
;;;WARRANTY; without  even the implied warranty  of MERCHANTABILITY or FITNESS  FOR A
;;;PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
;;;
;;;You should  have received a  copy of the GNU  Lesser General Public  License along
;;;with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


;;;; units and module header

(declare (unit mmux.template.version)
	 (emit-import-library mmux.template.version))

(module (mmux.template.version)
    (mmux-template-package-major-version
     mmux-template-package-minor-version
     mmux-template-package-patch-level
     mmux-template-package-prerelease-tag
     mmux-template-package-build-metadata
     mmux-template-package-version
     mmux-template-package-semantic-version)
  (import (scheme)
	  (prefix mmux.template.config config::))


;;;; version functions

(define (mmux-template-package-major-version)		config::MMUX_PKG_MAJOR_VERSION)
(define (mmux-template-package-minor-version)		config::MMUX_PKG_MINOR_VERSION)
(define (mmux-template-package-patch-level)		config::MMUX_PKG_PATCH_LEVEL)
(define (mmux-template-package-prerelease-tag)		config::MMUX_PKG_PRERELEASE_TAG)
(define (mmux-template-package-build-metadata)		config::MMUX_PKG_BUILD_METADATA)
(define (mmux-template-package-version)			config::MMUX_PKG_VERSION)
(define (mmux-template-package-semantic-version)	config::MMUX_PKG_SEMANTIC_VERSION)


;;;; done

#| end of module |# )

;;; end of file
