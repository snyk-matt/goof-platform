#!/bin/bash

mv spdx*.spdx.json sbom_temp.json
ls -lA
cat sbom_temp.json | jq -r '.' > sbom.json
ls -lA
jq 'try .sbom.packages[]? | {"sbom":{packagename:.name}}' sbom.json > sbom_output.json
ls -lA
cat -n 20 sbom_output.json
ls -lA
