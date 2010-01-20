DEST := ~/domains/oliverzheng.com/

html: assets
	mkdir -p build
	cp -r assets build/_assets
	r2w.py conf.ini

deploy: html
	mkdir -p $(DEST)
	cp -rf build/* $(DEST)

clean:
	rm -rf build
	rm -f log.txt
