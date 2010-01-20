html: assets
	mkdir -p build
	cp -r assets build/_assets
	r2w.py conf.ini
