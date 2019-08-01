#!/usr/bin/env bash

GH_USER=khrm
GH_REPO=devconf-tektonbooth-build-release
GH_TARGET=master

res=`curl --user "$GH_USER:$GITHUB_TOKEN" -X POST https://api.github.com/repos/${GH_USER}/${GH_REPO}/releases \
-d "
{
  \"tag_name\": \"v$VERSION\",
  \"target_commitish\": \"$GH_TARGET\",
  \"name\": \"v$VERSION\",
  \"body\": \"new version $VERSION\",
  \"draft\": false,
  \"prerelease\": false
}"`
echo Create release result: ${res}
rel_id=`echo ${res} | python -c 'import json,sys;print(json.load(sys.stdin)["id"])'`

curl --user "$GH_USER:$GITHUB_TOKEN" -X POST https://uploads.github.com/repos/${GH_USER}/${GH_REPO}/releases/${rel_id}/assets?name=${ASSETS_PATH}\
 --header 'Content-Type: text/javascript ' --upload-file ${ASSETS_PATH}
