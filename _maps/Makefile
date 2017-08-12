MAPPAGES := $(patsubst meae.congressional.congress08.%.county.Rmd, meae.congressional.congress08.%.county.md, $(wildcard meae.congressional.congress08.*.county.Rmd))

all : $(MAPPAGES)

meae.congressional.congress08.%.county.md : meae.congressional.congress08.%.county.Rmd
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'md_document')"
