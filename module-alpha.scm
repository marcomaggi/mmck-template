;; module-alpha.scm --

(declare (unit module-alpha)
	 (emit-import-library module-alpha)
	 (uses (library-for-expand)))

(module (module-alpha)
	(the-func the-macro)
	(import (scheme)
		(procedural-macros))
	(import-for-syntax (prefix (library-for-expand) expand::))
	(define (the-func)
	  (list 'module-alpha-the-func (the-macro)))
	(define-macro (the-macro)
	  (ir-macro-transformer
	     (lambda (form inject compare?)
	       (let ((thing (expand::the-func)))
		 `(list (the-func) ,thing)))))
	#| end of module |# )

;;; end of file
