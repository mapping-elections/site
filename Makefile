MAPPAGES := $(patsubst _maps/%.Rmd, _maps/%.md, $(wildcard _maps/*.Rmd))

build-preview : $(MAPPAGES)
	bundle exec jekyll build --future --incremental --config _config.yml,_config-preview.yml

serve : clean
	@echo "Previewing the site locally"
	bundle exec jekyll serve --watch --future

clean :
	@echo "Cleaning _site directory ..."
	rm -rf _site/*

deploy : clean
	@echo "Building dev site ..."
	bundle exec jekyll build --config _config.yml,_config-dev.yml --future
	@echo "Deploying to dev server ..."
	rsync --checksum --exclude dev/ --delete -avz _site/* earlyamerican:/websites/earlyamer/www/dev/
	@echo "Done."

deploy-production : clean
	@echo "Building site ..."
	bundle exec jekyll build
	@echo "Deploying to production server ..."
	rsync --checksum --exclude dev/ --delete -avz _site/* earlyamerican:/websites/earlyamer/www/
	@echo "Done."

build : clean $(MAPPAGES)
	bundle exec jekyll build

maps : $(MAPPAGES)

_maps/%.md : _maps/%.Rmd
	R --slave -e "set.seed(100); rmarkdown::render('$<', output_format = 'md_document')"

.PHONY: serve clean deploy deploy-production maps
