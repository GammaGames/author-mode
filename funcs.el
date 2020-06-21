(require 'shr)
(add-hook 'find-file-hook #'md-listener)
(defun md-listener ()
  (when (and (stringp buffer-file-name)
    (string-match "\\.md\\'" buffer-file-name))
    (
      author-mode
    )))


(defun author-mode ()
  (when (and (stringp buffer-file-name)
    (string-match "\\.md\\'" buffer-file-name))
      (set-frame-font "iA Writer Duospace 14" nil t)
      (writeroom-mode)
      (setq writeroom-width 88)
      (setq writeroom-mode-line-toggle-position 'mode-line-format)
      (visual-line-mode)
      (writeroom-toggle-mode-line)
      (display-time-mode)
      (line-number-mode)
      (wc-mode)
      (setq wc-modeline-format "%tw words, %w")
    ))
