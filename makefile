TEX = pandoc
PANDOC_VERSION = $(shell pandoc -v | head -n 1 | sed -e 's/pandoc //g' | awk -F. '{print $$1}')
src = template.tex details.yml
ifeq ($(PANDOC_VERSION),1)
	FLAGS = --latex-engine=xelatex
else
	FLAGS = --pdf-engine=xelatex
endif

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm output.pdf
