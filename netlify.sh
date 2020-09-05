#!/bin/sh

set -e

go get -u github.com/jimmysawczuk/tmpl
go get -u github.com/jimmysawczuk/scm-status

export PATH=$GOPATH/bin:$PATH

scm-status -out=REVISION.json
yarn dark-mode
tmpl
yarn build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers public/
