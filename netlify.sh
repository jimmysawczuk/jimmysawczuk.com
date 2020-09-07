#!/bin/sh

set -e

wget https://github.com/jimmysawczuk/tmpl/releases/download/v2.0.0/tmpl-v2.0.0-linux-amd64
mv tmpl-v2.0.0-linux-amd64 $GOPATH/bin/tmpl

go get -u github.com/jimmysawczuk/scm-status

export PATH=$GOPATH/bin:$PATH

scm-status -out=REVISION.json
yarn dark-mode
tmpl
yarn build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers public/
