(require 'shr)
(add-hook 'find-file-hook #'my-function)
(defun my-function ()
  (when (and (stringp buffer-file-name)
    (string-match "\\.md\\'" buffer-file-name))
    (
      author-mode
    )))


(defun author-mode ()
  (when (and (stringp buffer-file-name)
    (string-match "\\.md\\'" buffer-file-name))
      (writeroom-mode)
      (visual-line-mode)
      (wc-mode)
    ))
