#!/bin/sh

set -e;

rm -rf node_modules/xcomponent node_modules/post-robot node_modules/sync-browser-mocks node_modules/beaver-logger
npm install xcomponent post-robot sync-browser-mocks beaver-logger

rm dist/*;

gulp build;

git add dist --all;
git commit -m "Dist" || echo "Nothing to distribute";

mversion patch -m '%s';

git push;
git push --tags;
npm publish;
