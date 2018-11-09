#!/bin/sh

set -euo pipefail

cp -R /slate /slate-tmp
cp -R /template/* /slate-tmp/source/
cd /slate-tmp/source || exit 1
bundle exec middleman build --clean
rm -rf /slate/build/*
cp -R /slate-tmp/build/* /slate/build/
rm -rf /slate-tmp
