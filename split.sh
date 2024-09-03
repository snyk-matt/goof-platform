#!/bin/bash

mv spdx*.spdx.json sbom_temp.json
ls -lA
cat sbom_temp.json | jq -r '.' > sbom.json
ls -lA
jq '.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID}}' sbom.json > sbom_output.json
ls -lA
cat -n 20 sbom_output.json
ls -lA
