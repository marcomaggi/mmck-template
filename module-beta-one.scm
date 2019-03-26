;; module-beta-one.scm --

(declare (unit module-beta-one)
	 (emit-import-library module-beta-one)
	 (uses module-alpha))

(module (module-beta-one)
	(the-func)
	(import (scheme)
		(prefix module-alpha alpha::))
	(define (the-func)
	  (list 2 (alpha::the-func)))
	#| end of module |# )

;;; end of file
