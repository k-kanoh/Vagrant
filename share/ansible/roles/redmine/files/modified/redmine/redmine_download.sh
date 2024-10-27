#!/bin/sh

REDMINE_VERSION="5.1.3"
SHA256_CHECKSUM="8a22320fd9c940e6598f3ad5fb7a3933195c86068eee994ba6fcdc22c5cecb59"

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