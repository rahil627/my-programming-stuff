; how to paste?

; c-x,/
;  - auto-complete
; m-/
;  - auto-complete without the menu! niiiice

(defun f ()
  (format t "hello wolrd"))

(in-package :lem)
(lem-lisp-mode/internal::lisp-set-package "LEM")
(define-command ? () ;not sure if ? will work..
  describe-bindings)
;highlight the above region and press c-c,c-c

;Run M-x start-lisp-repl. In a Lisp buffer, C-c C-c evaluates the expression under the cursor in the current lem Lisp image.
  ;c-c,c-c automatically will open the repl..


