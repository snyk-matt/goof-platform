#!/bin/bash

# Define the input file
input_file="files_list"

#Run jq to generate structured informative sbom form original
mv spdx*.spdx.json sbom.json
jq '.sbom.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID'}}' sbom.json > sbom_output.json
ls -lA
