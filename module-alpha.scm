;; module-alpha.scm --
;;
;; This  file is  the  whole  body of  the  library "library-alpha"  and
;; defines a single module "module-alpha".

(declare (emit-import-library module-alpha))

;; Make the library "library-for-expand"  available, but do *not* import
;; it in  any lexical environment.   This library implements  the module
;; "module-for-expand": we will import it later.
;;
(require-library library-for-expand)

(module (module-alpha)
	(the-func (syntax: the-macro))
	(import (scheme)
		(procedural-macros)
		(chicken syntax)
		(chicken pretty-print))
	;;Import   "module-for-expand"   in  the   expand-time   lexical
	;;environment: its exported syntactic  bindings are available in
	;;the body of macro transformers.
	;;
	(import-for-syntax (prefix module-for-expand expand::)
			   (chicken pretty-print))

	(begin-for-syntax
	 (pretty-print 'evaluating-expand-time-code-of-module-alpha))

	(define-syntax the-macro
	  (ir-macro-transformer
	     (lambda (form inject compare?)
	       (let ((thing (expand::the-func)))
		 `(list 'module-alpha::the-macro (quote ,thing))))))

	(define (the-func)
	  (list 'module-alpha::the-func (the-macro)))

	(pretty-print 'evaluating-invoke-code-of-module-alpha)
	#| end of module |# )

;;; end of file
