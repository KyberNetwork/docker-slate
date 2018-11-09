#!/bin/sh

cp -R /slate/temp/* / /slate/source/
bundle exec middleman build --clean 