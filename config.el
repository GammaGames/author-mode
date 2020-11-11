(setq markdown-header-scaling t)
(set-frame-font "iA Writer Duospace 14" nil t)

(setq writeroom-width 0.75)
(setq writeroom-mode-line-toggle-position 'mode-line-format)
(set-face-background 'mode-line "black")

(setq mode-line-align-left
  (list
    '(:propertize (:eval (propertize (wc-format-modeline-string "%tw words, %w"))) face bold)))
(setq mode-line-align-middle
  '(:propertize (:eval (propertize "%b " 'face
    (let ((face (buffer-modified-p)))
      (if face 'bold-italic 'bold))
    'help-echo (buffer-file-name)))))
(setq mode-line-align-right
  '(:propertize (:eval (format-time-string "%l:%M %p")) face bold))

(add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[4 q")))
(add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[2 q")))
