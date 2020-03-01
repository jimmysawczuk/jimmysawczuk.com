#!/bin/sh

set -e

go get -u github.com/jimmysawczuk/tmpl
go get -u github.com/jimmysawczuk/scm-status

export PATH=$GOPATH/bin:$PATH

scm-status -out=REVISION.json
tmpl -o public/index.html -fmt html -min tmpl/index.tmpl
tmpl -o public/resume/index.html -fmt html -min tmpl/resume.tmpl
tmpl -o public/sitemap.xml tmpl/sitemap.xml.tmpl
yarn build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers public/
