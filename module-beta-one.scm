;; module-beta-one.scm --

(declare (unit module-beta-one)
	 (emit-import-library module-beta-one))

(module (module-beta-one)
	(beta-one)

	(import (scheme))

	(define (beta-one)
	  2)

	#| end of module |# )

;;; end of file
