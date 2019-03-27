;; module-for-expand.scm --
;;
;; This file is  the whole body of the  library "library-for-expand" and
;; defines a single module "module-for-expand".
;;
;; This  library is  meant  to be  loaded in  the  expansion phase:  its
;; exported syntactic bindings are meant to be used in the body of macro
;; transformers.

(declare (emit-import-library module-for-expand))

(module (module-for-expand)
	(the-func)
	(import (scheme)
		(chicken syntax)
		(chicken pretty-print))
	(import-for-syntax (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-alpha))

	(define (the-func)
	  'module-for-expand::the-func)

	(pretty-print 'evaluating-invoke-code-of-module-for-expand)
	#| end of module |# )

;;; end of file
