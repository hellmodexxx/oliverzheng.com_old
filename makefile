DEST := ~/domains/oliverzheng.com/

html: assets src update
	mkdir -p build
	cp -r assets build/_assets
	cp -r files build/files
	r2w.py conf.ini

update:
	git submodule init
	git submodule update

deploy: html
	mkdir -p $(DEST)
	cp -rf build/* $(DEST)

clean:
	rm -rf build
	rm -f log.txt
