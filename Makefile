#!/usr/bin/make -f

HTML_FILES = index.html db/ sitemap.xml search.html 404.html
ASSET_FILES = s.css js/

clean:
	git rm -rf $(HTML_FILES) $(ASSET_FILES) || rm -rf $(HTML_FILES) $(ASSET_FILES)

add:
	git add $(HTML_FILES) $(ASSET_FILES)

deploy: add
	git commit -m "Update web content"
	git push

.PHONY: clean add deploy
