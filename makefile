PANDOC = /usr/bin/env pandoc
TEMPLATE = template.tex
src = details.yml
out = output.pdf
FLAGS = --pdf-engine=xelatex

render : $(src)
	$(PANDOC) -o $(out) --template=$(TEMPLATE) $(FLAGS)  --standalone -- $(src) 

.PHONY: clean
clean :
	rm $(name)
