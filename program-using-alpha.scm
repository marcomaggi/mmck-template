;; program-using-alpha.scm --

(declare (uses (library-alpha)))

(import (scheme)
	(prefix (library-alpha) alpha::)
	(chicken pretty-print))

(define (main . args)
  (pretty-print (alpha::the-func)))

;;; end of file
