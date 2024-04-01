#!/bin/sh

REDMINE_VERSION="5.1.2"
SHA256_CHECKSUM="26c0ca0a9aaee1ceb983825bf1266c99b0850bf013c178713f5a3b0080012123"

echo "[INFO] Downloading..."

cd $(dirname $0)

curl -O -s https://www.redmine.org/releases/redmine-${REDMINE_VERSION}.tar.gz

line=`sha256sum redmine-${REDMINE_VERSION}.tar.gz`
set -f
set -- $line

if [ $SHA256_CHECKSUM = $1 ];then
  tar xvfz redmine-${REDMINE_VERSION}.tar.gz
  cp -Rf redmine-${REDMINE_VERSION}/. src
  cp -f config.ru src/config.ru
  rm -rf redmine-${REDMINE_VERSION}
  rm -rf redmine/redmine-${REDMINE_VERSION}
  rm redmine-${REDMINE_VERSION}.tar.gz
else
  echo "[WARN] Doesn't match the check sum."
fi

echo "[INFO] Finish."