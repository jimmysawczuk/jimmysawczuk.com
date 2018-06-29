default: clean
	mkdir -p resume
	scm-status -out=REVISION.json
	MODE=dev tmpl tmpl/index.tmpl > index.html
	MODE=dev tmpl tmpl/resume.tmpl > resume/index.html
	webpack -p

dev: clean
	mkdir -p resume
	scm-status -out=REVISION.json
	MODE=dev tmpl tmpl/index.tmpl > index.html
	MODE=dev tmpl tmpl/resume.tmpl > resume/index.html
	webpack-dev-server

clean:
	rm -rf build.zip build resume index.html

production: clean
	mkdir -p build/resume build/build
	scm-status -out=REVISION.json
	MODE=production tmpl tmpl/index.tmpl > build/index.html
	MODE=production tmpl tmpl/resume.tmpl > build/resume/index.html
	parcel build -d build/build -o main src/main.js
	parcel build -d build/build -o resume src/resume.js
	cp -R img *.png *.xml *.ico REVISION.json build/
	AWS_PROFILE=jsawczuk aws s3 sync --acl=public-read build s3://jimmysawczuk.com

.PHONY: clean
