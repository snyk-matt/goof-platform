#!/bin/bash

mv spdx*.spdx.json sbom_temp.json
ls -lA
cat sbom_temp.json | jq -r '.' > sbom.json
cat sbom.json
jq '.sbom.packages[] | {"sbom":{packagename:.name}}' sbom.json > sbom_output.json
ls -lA
cat sbom_output.json
