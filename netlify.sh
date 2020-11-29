#!/bin/sh

set -e

export PATH=$HOME/bin:$PATH
mkdir -p $HOME/bin

wget https://github.com/jimmysawczuk/tmpl/releases/download/v2.0.0/tmpl-v2.0.0-linux-amd64
mv tmpl-v2.0.0-linux-amd64 $HOME/bin/tmpl
chmod +x $HOME/bin/tmpl

wget https://github.com/jimmysawczuk/scm-status/releases/download/v2.2.0/scm-status-v2.2.0-linux-amd64
mv scm-status-v2.2.0-linux-amd64 $HOME/bin/scm-status
chmod +x $HOME/bin/scm-status

scm-status -out=REVISION.json
yarn dark-mode
tmpl
yarn build
cp -R img *.png *.xml *.ico REVISION.json manifest.json site.webmanifest _redirects _headers public/
