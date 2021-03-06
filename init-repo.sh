#!/usr/bin/env bash
#
# Script to initialize angular repo
# - install required node packages
# - install Testacular
# - install git hooks


node=`which node 2>&1`
if [ $? -ne 0 ]; then
  echo "Please install NodeJS."
  echo "http://nodejs.org/"
  exit 1
fi

npm=`which npm 2>&1`
if [ $? -ne 0 ]; then
  echo "Please install NPM."
fi


echo "Installing required npm packages..."
npm install

testacular=`which testacular 2>&1`
if [ $? -ne 0 ]; then
  echo "Installing Testacular..."
  npm install -g testacular
fi

echo "Installing git hooks..."
ln -sf ../../validate-commit-msg.js .git/hooks/commit-msg
