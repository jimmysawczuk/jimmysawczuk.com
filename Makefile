default:
	scm-status -out=REVISION.json
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
	scm-status -out=REVISION.json
	mkdir -p resume
	MODE=production go run tmpl.go tmpl/index.html > index.html
	MODE=production go run tmpl.go tmpl/resume.html > resume/index.html
	webpack -p
	zip -q -r build.zip build img resume .htaccess *.png *.xml *.ico *.html REVISION.json
	scp build.zip jsawczuk@durin:~/jimmysawczuk.com
	ssh jsawczuk@durin 'cd ~/jimmysawczuk.com && mkdir -p build && unzip -q -d build build.zip && rm build.zip && rm -rf last && mv public last && mv build public'

.PHONY: clean
