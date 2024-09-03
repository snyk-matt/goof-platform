#!/bin/bash

mv spdx*.spdx.json sbom_temp.json
ls -lA
cat sbom_temp.json | jq -r '.' > sbom.json
ls -lA
jq '.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID}}' sbom.json > sbom_output.json
ls -lA
mkdir sbom_chunks
ls -lA
echo "Dir done"
split -l 11 sbom_output.json sbom_chunks/sbom
echo "split done should see files"
ls sbom_chunks/ > files_list
echo "split completed"
ls -lA 
cat files_list
