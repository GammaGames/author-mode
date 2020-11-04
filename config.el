(add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[4 q")))
(add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[2 q")))
