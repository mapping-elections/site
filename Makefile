serve :
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

build : clean
	bundle exec jekyll build

.PHONY: serve clean deploy deploy-production

