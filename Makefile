serve :
	bundle exec jekyll serve --watch --future

build :
	bundle exec jekyll build

clean :
	rm -rf _site/*

deploy : clean build
	@echo "Deploying to server ..."
	rsync --checksum --delete -avz _site/* earlyamerican:/websites/earlyamer/www/
	
.PHONY: serve build clean deploy

