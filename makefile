output.pdf : template.tex data.yml
	pandoc $(filter-out $<,$^ ) -o $@ --latex-engine=xelatex --template=$<

clean :
	rm output.pdf
