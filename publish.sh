#!/usr/bin/env bash

GH_USER=khrm
GH_REPO=devconf-tektonbooth-build-release
GH_TARGET=master
TAG_NAME=${VERSION:-0.1.0}
VERSION=${VERSION:-0.1.0}
res=`curl --user "$GH_USER:$GITHUB_TOKEN" -X POST https://api.github.com/repos/${GH_USER}/${GH_REPO}/releases \
-d "
{
  \"tag_name\": \"v$TAG_NAME\",
  \"target_commitish\": \"$GH_TARGET\",
  \"name\": \"v$VERSION\",
  \"body\": \"Latest version with \nlot of stuffs $VERSION\",
  \"draft\": false,
  \"prerelease\": false
}"`
echo Create release result: ${res}
rel_id=`echo ${res} | python -c 'import json,sys;print(json.load(sys.stdin)["id"])'`

curl --user "$GH_USER:$GITHUB_TOKEN" -X POST https://uploads.github.com/repos/${GH_USER}/${GH_REPO}/releases/${rel_id}/assets?name=${ASSETS_PATH}\
 --header 'Content-Type: text/javascript ' --upload-file ${ASSETS_PATH}
