;; module-beta-two.scm --

(declare (unit module-beta-two)
	 (emit-import-library module-beta-two)
	 (uses module-beta-one)
	 (uses module-alpha))

(module (module-beta-two)
	(the-func)
	(import (scheme)
		(prefix module-beta-one beta-one::)
		(prefix module-alpha    alpha::))
	(define (the-func)
	  (list 'module-beta-two-the-func
		(beta-one::the-func)
		(alpha::the-func)))
	#| end of module |# )

;;; end of file
