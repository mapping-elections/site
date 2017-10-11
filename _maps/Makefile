MAPPAGES := $(patsubst %.Rmd, %.md, $(wildcard *.Rmd))

all : $(MAPPAGES)

%.md : %.Rmd
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'md_document')"
