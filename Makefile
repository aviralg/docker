

.PHONY: base
base:
	docker build -t aviralgoel/$@ $@

.PHONY: latex
latex: base
	docker build -t aviralgoel/$@ $@

.PHONY: haskell
haskell: base
	docker build -t aviralgoel/$@ $@
