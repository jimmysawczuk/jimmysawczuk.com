include .env
export $(shell sed 's/=.*//' .env)

default: dev

dev: clean
	scm-status -out=REVISION.json
	MODE=dev tmpl -o build/index.html tmpl/index.tmpl
	MODE=dev tmpl -o build/resume/index.html tmpl/resume.tmpl
	parcel build -d build/dist src/*.js
	cp -R img *.png *.xml *.ico REVISION.json build/

clean:
	rm -rf build

production: clean
	scm-status -out=REVISION.json
	MODE=production tmpl -o build/index.html -timestamp-assets=false tmpl/index.tmpl
	MODE=production tmpl -o build/resume/index.html -timestamp-assets=false tmpl/resume.tmpl
	parcel build -d build/dist src/*.js
	cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers build/
	netlify deploy -s ${NETLIFY_SITE_ID} -m "rev. `scm-status | jq -r '.hex.short'`" -p -d build

.PHONY: clean dev
