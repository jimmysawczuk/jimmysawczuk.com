default: dev

dev: clean
	mkdir -p build/resume build/dist
	scm-status -out=REVISION.json
	MODE=dev tmpl tmpl/index.tmpl > build/index.html
	MODE=dev tmpl tmpl/resume.tmpl > build/resume/index.html
	parcel build -d build/dist src/*.js
	cp -R img *.png *.xml *.ico REVISION.json build/

clean:
	rm -rf build

production: clean
	mkdir -p build/resume build/dist
	scm-status -out=REVISION.json
	MODE=production tmpl tmpl/index.tmpl > build/index.html
	MODE=production tmpl tmpl/resume.tmpl > build/resume/index.html
	parcel build -d build/dist src/*.js
	cp -R img *.png *.xml *.ico REVISION.json build/
	AWS_PROFILE=jsawczuk aws s3 sync --acl=public-read --delete build s3://jimmysawczuk.com

.PHONY: clean dev
