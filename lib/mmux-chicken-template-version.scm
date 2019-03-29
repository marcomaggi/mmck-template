;;; -*- coding: utf-8-unix  -*-
;;;
;;;Part of: MMUX CHICKEN Template
;;;Contents: version functions
;;;Date: Fri Mar 29, 2019
;;;
;;;Abstract
;;;
;;;	This unit defines version functions.  This is the one compilation unit in the
;;;	shared library that does not DECLARE itself with UNIT.
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

(declare #;(unit mmux-chicken-template-version)
	 (emit-import-library mmux-chicken-template-version))

(module (mmux-chicken-template-version)
    (mmux-chicken-template-version-string
     mmux-chicken-template-version-interface-current
     mmux-chicken-template-version-interface-revision
     mmux-chicken-template-version-interface-age)
  (import (scheme)
    (prefix mmux-chicken-template-config config::))


;;;; version functions

(define (mmux-chicken-template-version-string)
  config::mmux_chicken_template_VERSION_INTERFACE_STRING)

(define (mmux-chicken-template-version-interface-current)
  config::mmux_chicken_template_VERSION_INTERFACE_CURRENT)

(define (mmux-chicken-template-version-interface-revision)
  config::mmux_chicken_template_VERSION_INTERFACE_REVISION)

(define (mmux-chicken-template-version-interface-age)
  config::mmux_chicken_template_VERSION_INTERFACE_AGE)


;;;; done

#| end of module |# )

;;; end of file
