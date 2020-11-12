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
      (spacemacs/toggle-highlight-current-line-globally-off)
      (writeroom-mode)
      (spacemacs/toggle-visual-line-navigation-on)
      (writeroom-toggle-mode-line)
      (wc-mode)
      (blink-cursor-mode 0)

      (setq mode-line-format
                (list
                  mode-line-align-left
                  '(:eval (mode-line-fill-center 'mode-line (reserve-left/middle)))
                  mode-line-align-middle
                  '(:eval
                    (mode-line-fill-right 'mode-line (reserve-middle/right)))
                  mode-line-align-right
                ))
      (paper-theme)
    ))

(defun paper-theme ()
  ;; doens't work??
    (set-face-foreground 'mode-line "#ffffff")
    (set-face-background 'mode-line "#000000")
  )

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
