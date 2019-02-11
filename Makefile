#!/usr/bin/make -f

SASS_OPTS = --style compressed
HTML_PATHS = index.html db/ sitemap.xml search.html 404.html

all: clean download build

clean:
	git rm -rf $(HTML_PATHS) || rm -rf $(HTML_PATHS)

build: css
	mkdir -p db/
	python build.py

download:
	git pull
	git submodule update --recursive --remote

add:
	git add $(HTML_PATHS)

deploy: add
	git commit -m "update web content"
	git push

serve:
	@echo "Starting local server at http://0.0.0.0:8100"
	@python -m SimpleHTTPServer 8100

css:
	@which sassc > /dev/null &2> /dev/null && \
         sassc ${SASS_OPTS} src/css/style.scss s.css

.PHONY: all clean build download add deploy serve css
