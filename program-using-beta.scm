;; program-using-beta.scm --

(declare (uses (library-beta)))

(import (scheme)
	(prefix (library-beta) beta::)
	(chicken pretty-print))

(define (main . args)
  (pretty-print (beta::the-func)))

;;; end of file
