#!/usr/bin/env sh
set -e
yarn build
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:uphg/vue-transition-demo.git master:gh-pages
git push -f git@gitee.com:uphg/vue-transition-demo.git master:gh-pages

cd -
