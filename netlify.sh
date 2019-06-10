#!/bin/sh

set -e

npm i -g yarn

echo $FONTAWESOME_AUTH_TOKEN

echo '@fortawesome:registry=https://npm.fontawesome.com/' > ~/.npmrc
echo "//npm.fontawesome.com/:_authToken=$FONTAWESOME_AUTH_TOKEN" >> ~/.npmrc

go get github.com/jimmysawczuk/tmpl
go get github.com/jimmysawczuk/scm-status

MODE=production tmpl -o build/index.html -timestamp-assets=false tmpl/index.tmpl
MODE=production tmpl -o build/resume/index.html -timestamp-assets=false tmpl/resume.tmpl

npm run build
cp -R img *.png *.xml *.ico REVISION.json manifest.json _redirects _headers build/
