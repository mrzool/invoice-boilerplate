TEX = pandoc
src = template.tex details.yml
tex_src = template.tex
FLAGS = --pdf-engine=xelatex

output.pdf : $(src)
	$(TEX) $(filter-out $<,$^ ) -o $@ --template=$< $(FLAGS)

.PHONY: clean
clean :
	rm output.pdf

# with custom yaml file
# substitute ".yml" for output -> src https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
.PHONY: with
with :
	$(TEX) $(yml) -o $(subst .yml,,$(yml)).pdf --template=$(tex_src) $(FLAGS)
