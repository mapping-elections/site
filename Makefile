MAPPAGES := $(patsubst _maps/%.Rmd, _maps/%.md, $(wildcard _maps/*.Rmd))

build : $(MAPPAGES)
	bundle exec jekyll build --future --incremental --config _config.yml,_config-preview.yml

serve : clean
	@echo "Previewing the site locally"
	bundle exec jekyll serve --watch --future --incremental

clean :
	@echo "Cleaning _site directory ..."
	rm -rf _site/*

clobber-maps :
	@echo "Clobbering the generated maps ..."
	rm -f _maps/*.md

deploy : clean $(MAPPAGES)
	@echo "Building dev site ..."
	bundle exec jekyll build --config _config.yml,_config-dev.yml --future
	@echo "Deploying to dev server ..."
	rsync --checksum --delete -avz _site/* earlyamerican:/websites/earlyamer/www/dev/
	@echo "Done."

deploy-production : clean $(MAPPAGES)
	@echo "Building site ..."
	bundle exec jekyll build
	@echo "Deploying to production server ..."
	rsync --checksum --exclude dev/ --delete -avz _site/* earlyamerican:/websites/earlyamer/www/
	@echo "Done."

maps : $(MAPPAGES)

_maps/%.md : _maps/%.Rmd
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'md_document', output_options = c(preserve_yaml = TRUE))"

.PHONY: serve clean deploy deploy-production maps clobber-maps build
