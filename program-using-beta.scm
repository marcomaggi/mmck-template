;; program-using-beta.scm --

;; Make the library "library-beta" available,  but do *not* import it in
;; any  lexical  environment.   This   library  implements  the  modules
;; "module-beta-one" and "module-beta-two": we will import them later.
;;
(require-library library-beta)

(import (scheme)
	(prefix module-beta-one beta-one::)
	(prefix module-beta-two beta-two::)
	(chicken pretty-print))

(define (main)
  (pretty-print (list 'program-using-beta::main
		      (beta-two::the-func)
		      (beta-one::the-func))))

(main)

;;; end of file
