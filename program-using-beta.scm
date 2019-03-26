;; program-using-beta.scm --

(declare (uses module-beta-two))

(import (scheme)
	(prefix module-beta-two beta-two::)
	(chicken pretty-print))

(define (main . args)
  (pretty-print (beta-two::the-func)))

;;; end of file
