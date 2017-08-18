serve :
	@echo "Previewing the site locally"
	bundle exec jekyll serve --watch --future

clean :
	@echo "Cleaning _site directory ..."
	rm -rf _site/*

deploy-production : clean
	@echo "Building site ..."
	bundle exec jekyll build
	@echo "Deploying to production server ..."
	rsync --checksum --delete -avz _site/* earlyamerican:/websites/earlyamer/www/
	@echo "Done."
	

deploy-dev : clean 
	@echo "Building dev site ..."
	bundle exec jekyll build --future
	@echo "Deploying to dev server ..."
	rsync --checksum --delete -avz _site/* earlyamerican:/websites/earlyamer/www/dev/
	@echo "Done."

.PHONY: serve clean deploy-production deploy-dev

