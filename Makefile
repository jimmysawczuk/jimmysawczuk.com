default:
	scm-status -out=REVISION.json
	go run tmpl.go tmpl/index.html > index.html
	go run tmpl.go tmpl/resume.html > resume/index.html
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
	mkdir -p build/resume
	scm-status -out=REVISION.json
	MODE=production tmpl tmpl/index.tmpl > build/index.html
	MODE=production tmpl tmpl/resume.tmpl > build/resume/index.html
	webpack -p --output-path=build
	cp -R img .htaccess *.png *.xml *.ico REVISION.json build/
	zip -q -r build.zip build
	scp build.zip jsawczuk@durin:~/jimmysawczuk.com
	ssh jsawczuk@durin 'cd ~/jimmysawczuk.com && mkdir -p build && unzip -q -d . build.zip && rm build.zip && rm -rf last && mv public last && mv build public'

.PHONY: clean
