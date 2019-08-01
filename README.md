# Demo of build and release pipeline

## Prerequisites:
Tekton: https://github.com/tektoncd/pipeline/blob/master/docs/install.md

## Create Pipeline

`
kubectl apply -f buildrelease.yaml
`

## Run Pipeline

`
kubectl apply -f release-run.yaml
`

Or if you use https://github.com/tektoncd/cli

`
tkn pipeline start build-release -r source-repo=devconf
`
