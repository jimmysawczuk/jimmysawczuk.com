default: dev

dev: clean
	scm-status -out=REVISION.json
	MODE=dev tmpl -o public/index.html tmpl/index.tmpl
	MODE=dev tmpl -o public/resume/index.html tmpl/resume.tmpl
	cp -R img *.png *.xml *.ico REVISION.json manifest.json browserconfig.xml public/
	npm run build

clean:
	rm -rf public

.PHONY: clean dev
