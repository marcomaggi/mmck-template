;; module-for-expand.scm --

(declare (unit module-for-expand)
	 (emit-import-library module-for-expand))

(module (module-for-expand)
	(the-func)
	(import (scheme))
	(define (the-func)
	  'module-for-expand-the-func)
	#| end of module |# )

;;; end of file
