;; module-beta-one.scm --

;; We link  this module along  with "module-beta-two".  We  declare this
;; file as  a "unit", so  that the  invoke code of  "module-beta-one" is
;; executed before the one of "module-beta-two".
;;
(declare (unit module-beta-one)
	 (emit-import-library module-beta-one))

;; Make the library "library-alpha" available, but do *not* import it in
;; any  lexical   environment.   This  library  implements   the  module
;; "module-alpha": we will import it later.
;;
(require-library library-alpha)

(module (module-beta-one)
	(the-func)
	(import (scheme)
		(chicken syntax)
		(chicken pretty-print)
		(prefix module-alpha alpha::))
	(import-for-syntax (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-beta-one))

	(define (the-func)
	  (list 'module-beta-one::the-func
		(alpha::the-func)))

	(pretty-print 'evaluating-invoke-code-of-module-beta-one)
	#| end of module |# )

;;; end of file
