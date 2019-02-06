#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

../k8s.io/code-generator/generate-groups.sh all \
  rep/rafayservice   rep \
  "rafayservice:v1" 
