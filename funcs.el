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
      (spacemacs/toggle-highlight-current-line-globally-on)
      (setq markdown-header-scaling t)
      (set-frame-font "iA Writer Duospace 14" nil t)

      (writeroom-mode)
      (setq writeroom-width 88)
      (setq writeroom-mode-line-toggle-position 'mode-line-format)
      (spacemacs/toggle-visual-line-navigation-on)
      (writeroom-toggle-mode-line)
      (wc-mode)

      (setq mode-line-align-left
        (list
          '(:propertize (:eval (propertize (wc-format-modeline-string "%tw words, %w - "))) face bold)
          '(:propertize (:eval (propertize
            (if (< (string-to-number (wc-format-modeline-string "%tw ")) 101)
              "Micro Fiction"
              (if (< (string-to-number (wc-format-modeline-string "%tw ")) 1000)
                "Flash Fiction"
                (if (< (string-to-number (wc-format-modeline-string "%tw ")) 7500)
                  "Short Story"
                  (if (< (string-to-number (wc-format-modeline-string "%tw ")) 20000)
                    "Novelette"
                      (if (< (string-to-number (wc-format-modeline-string "%tw ")) 50000)
                        "Novella"
                        (if (< (string-to-number (wc-format-modeline-string "%tw ")) 110000)
                          "Novel"
                          "Epic")))))))) face bold-italic)))
      (setq mode-line-align-middle
        '(:propertize (:eval (propertize "%b " 'face
          (let ((face (buffer-modified-p)))
            (if face 'bold-italic 'bold))
          'help-echo (buffer-file-name)))))
      (setq mode-line-align-right
        '(:propertize (:eval (format-time-string "%l:%M %p")) face bold))
      (setq mode-line-format
                (list
                  mode-line-align-left
                  '(:eval (mode-line-fill-center 'mode-line
                                                (reserve-left/middle)))
                  mode-line-align-middle
                  '(:eval
                    (mode-line-fill-right 'mode-line
                                          (reserve-middle/right)))
                  mode-line-align-right
                ))
    ))

;; Taken from https://emacs.stackexchange.com/a/16658/29319
(defun mode-line-fill-right (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun mode-line-fill-center (face reserve)
  "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                            (.5 . left-margin))))
              'face face))

(defconst RIGHT_PADDING 1)

(defun reserve-left/middle ()
  (/ (length (format-mode-line mode-line-align-middle)) 2))

(defun reserve-middle/right ()
  (+ RIGHT_PADDING (length (format-mode-line mode-line-align-right))))
