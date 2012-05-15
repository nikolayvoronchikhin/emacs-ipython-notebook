(eval-when-compile (require 'cl))
(require 'ert)

(require 'ein-kernel)


(ert-deftest ein:kernel-start-check-url ()
  (let* ((port 8888)
         (kernel (ein:kernel-new 8888))
         (notebook-id "NOTEBOOK-ID")
         (desired-url "http://127.0.0.1:8888/kernels?notebook=NOTEBOOK-ID")
         got-url)
    (flet ((url-retrieve (url &rest ignore) (setq got-url url)))
      (ein:kernel-start kernel notebook-id nil)
      (should (equal got-url desired-url)))))
