;;; foreign-languages
;; Some commands to help me adding english words from the book
;; Anglais Modern to Anglais-Modern.csv file

(defun ta-goto-new-word ()
  "Go to next line into the column French."
  (interactive)
  (when (search-forward "_")
		(call-interactively 'csv-tab-command)))

(defun ta-add-word-meaning ()
  "Mark 'word' at point and copy it into the buffer below.

The buffer below should contain the file \"word-meaning.org\".
This command helps me keeping of the word I don't know the meaning."
  (interactive)
	(ta-mark-sexp-at-point)
	(call-interactively 'kill-ring-save)
	(windmove-down)
	(insert "- ")
	(yank)
	(insert ":")
	(newline)
	(save-buffer)
	(windmove-up)
	(call-interactively 'csv-tab-command))

(define-key tsv-mode-map (kbd "RET") 'ta-goto-new-word)
(define-key tsv-mode-map (kbd "C-<tab>") 'ta-add-word-meaning)
