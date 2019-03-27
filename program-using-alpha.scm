;; program-using-alpha.scm --

(require-library library-alpha)

(import (scheme)
	(prefix module-alpha alpha::)
	(chicken pretty-print))

(define (main)
  (pretty-print (list 'program-using-alpha::main
		      (alpha::the-func))))

(main)

;;; end of file
