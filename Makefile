default: dev

dev: clean
	scm-status -out=REVISION.json
	MODE=dev tmpl -o public/index.html tmpl/index.tmpl
	MODE=dev tmpl -o public/resume/index.html tmpl/resume.tmpl
	MODE=dev tmpl -o public/sitemap.xml tmpl/sitemap.xml.tmpl
	cp -R img *.png *.xml *.ico REVISION.json manifest.json public/
	yarn minify-html
	yarn build

clean:
	rm -rf public

.PHONY: clean dev
