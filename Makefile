default: dev

dev: clean
	scm-status -out=REVISION.json
	MODE=dev tmpl -o build/index.html tmpl/index.tmpl
	MODE=dev tmpl -o build/resume/index.html tmpl/resume.tmpl
	cp -R img *.png *.xml *.ico REVISION.json manifest.json browserconfig.xml build/
	npm run build

clean:
	rm -rf build

.PHONY: clean dev
