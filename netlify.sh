#!/bin/sh

set -e

go get github.com/jimmysawczuk/tmpl
go get github.com/jimmysawczuk/scm-status

MODE=production tmpl -o public/index.html -timestamp-assets=false tmpl/index.tmpl
MODE=production tmpl -o public/resume/index.html -timestamp-assets=false tmpl/resume.tmpl

npm run build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers public/
