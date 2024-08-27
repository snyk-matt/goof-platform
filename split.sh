#!/bin/bash

# Define the input file
input_file="files_list"

#Run jq to generate structured informative sbom form original
unset env github
ls -lA
mv spdx*.spdx.json sbom.json
ls -lA
github=$(grep -m 1 "name" sbom.json)
jq '.sbom.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID'}}' sbom.json > sbom_output.json
ls -lA
#Split the big file to small json files to represent each as separate log line (10 lines each)
mkdir sbom_chunks
split -l 11 sbom_output.json sbom_chunks/sbom
ls sbom_chunks/ > files_list
echo "split completed"
