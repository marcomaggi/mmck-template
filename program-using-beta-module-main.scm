;; program-using-beta-module-main.scm --
;;
;; This   file  is   the   single  component   the  executable   program
;; "program-using-beta".   There  is neither  the  need  to declare  any
;; "unit", nor to declare any "uses".
;;
;; To keep the namespace clean: this file defines a single module "main"
;; which exports  no syntactic  bindings; there  is no  need to  emit an
;; import library for this module.

(module (main)
	()
	(import (scheme)
		(prefix module-beta-one beta-one::)
		(prefix module-beta-two beta-two::)
		(chicken pretty-print))

	(define (main)
	  (pretty-print (list 'program-using-beta::main
			      (beta-two::the-func)
			      (beta-one::the-func))))

	(main)
	#| end of module |# )

;;; end of file
