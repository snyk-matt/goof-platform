#!/bin/bash
# Define the input file
input_file="files_list"

mv spdx*.spdx.json sbom_temp.json
ls -lA
cat sbom_temp.json | jq -r '.' > sbom.json
ls -lA
cat sbom.json
jq '.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID,referenceLocator:.externalRefs[].referenceLocator}}' sbom.json > sbom_output.json
#ls -lA
mkdir sbom_chunks
#ls -lA
#echo "Dir done"
split -l 11 sbom_output.json sbom_chunks/sbom
#echo "split done should see files"
#ls sbom_chunks/ > files_list
#echo "split completed"
#ls -lA 
#cat files_list
# Read the file line by line
while IFS= read -r line || [ -n "$line" ]; do
    # Execute the command in each line
    curl -X POST 'https://ingress.coralogix.com/webhooks/v1/_hLsZCzkHFHkxB8sIXKbN?cx-api-key=cxtp_O8rQunc7vOLXpjVFaIRP6ifPA83VD1&cx-application-name=github&cx-subsystem-name=sbom' -H 'Content-Type: application/json' -d @"sbom_chunks/""$line" -v
done < "$input_file"
