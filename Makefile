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
	scm-status -out=REVISION.json
	MODE=production tmpl -o build/index.html tmpl/index.tmpl
	MODE=production tmpl -o build/resume/index.html tmpl/resume.tmpl
	parcel build -d build/dist src/*.js
	cp -R img *.png *.xml *.ico REVISION.json build/
	AWS_PROFILE=jsawczuk aws s3 sync --acl=public-read --delete build s3://jimmysawczuk.com

.PHONY: clean dev
