(setq markdown-header-scaling t)
(set-frame-font "iA Writer Duospace 14" nil t)

(setq git-gutter+-added "green")
(setq git-gutter+-added-sign "▒")
(setq git-gutter+-modified "yellow")
(setq git-gutter+-modified-sign "░")
(setq git-gutter+-deleted "red")
(setq git-gutter+-deleted-sign "▓")

(setq writeroom-width 88)
(setq writeroom-mode-line-toggle-position 'mode-line-format)

(setq mode-line-align-left
  (list
    '(:propertize (:eval (propertize (wc-format-modeline-string "%tw words, %w - "))) face bold)
    '(:propertize (:eval (propertize
      (cond ((< (string-to-number (wc-format-modeline-string "%tw ")) 101) "Micro Fiction")
            ((< (string-to-number (wc-format-modeline-string "%tw ")) 1000) "Flash Fiction")
            ((< (string-to-number (wc-format-modeline-string "%tw ")) 7500) "Short Story")
            ((< (string-to-number (wc-format-modeline-string "%tw ")) 20000) "Novelette")
            ((< (string-to-number (wc-format-modeline-string "%tw ")) 50000) "Novella")
            ((< (string-to-number (wc-format-modeline-string "%tw ")) 110000) "Novel")
            (t "Epic")))) face bold-italic)))
(setq mode-line-align-middle
  '(:propertize (:eval (propertize "%b " 'face
    (let ((face (buffer-modified-p)))
      (if face 'bold-italic 'bold))
    'help-echo (buffer-file-name)))))
(setq mode-line-align-right
  '(:propertize (:eval (format-time-string "%l:%M %p")) face bold))
