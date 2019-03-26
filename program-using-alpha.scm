;; program-using-alpha.scm --

(declare (uses module-alpha))

(import (scheme)
	(prefix module-alpha alpha::)
	(chicken pretty-print))

(define (main . args)
  (pretty-print (alpha::the-func)))

;;; end of file
