DEST := ~/domains/oliverzheng.com/

html: assets src files conf.ini tidyconfig.txt
	mkdir -p build/files
	cp -r assets build/_assets
	cp -r files/* build/files/
	r2w.py conf.ini
	tidy -quiet \
         -config tidyconfig.txt \
         -m `find build -name '*.html' ! -path '*files/*'` \
        || test 0

update:
	git submodule init
	git submodule update

deploy: html
	mkdir -p $(DEST)
	cp -rf build/* $(DEST)

clean:
	rm -rf build
	rm -f log.txt
