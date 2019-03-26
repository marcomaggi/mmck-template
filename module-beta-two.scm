;; module-beta-two.scm --

(declare (unit module-beta-two)
	 (emit-import-library module-beta-two)
	 (uses module-beta-one))

(module (module-beta-two)
	(beta-two)

	(import (scheme)
		(module-beta-one))

	(define (beta-two)
	  (cons (beta-one) 2))

	#| end of module |# )

;;; end of file
