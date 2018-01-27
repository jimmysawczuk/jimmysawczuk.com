default:
	scm-status -out=REVISION.json
	go run tmpl.go tmpl/index.html > index.html
	go run tmpl.go tmpl/resume.html > resume/index.html
	webpack -p

dev: clean
	mkdir -p resume
	scm-status -out=REVISION.json
	MODE=dev go run tmpl.go tmpl/index.html > index.html
	MODE=dev go run tmpl.go tmpl/resume.html > resume/index.html
	webpack-dev-server

clean:
	rm -rf build.zip build resume index.html

production: clean
	mkdir -p build/resume
	scm-status -out=REVISION.json
	MODE=production go run tmpl.go tmpl/index.html > build/index.html
	MODE=production go run tmpl.go tmpl/resume.html > build/resume/index.html
	webpack -p --output-path=build
	cp -R img .htaccess *.png *.xml *.ico REVISION.json build/
	zip -q -r build.zip build
	scp build.zip jsawczuk@durin:~/jimmysawczuk.com
	ssh jsawczuk@durin 'cd ~/jimmysawczuk.com && mkdir -p build && unzip -q -d . build.zip && rm build.zip && rm -rf last && mv public last && mv build public'

.PHONY: clean
