#!/bin/bash

mv spdx*.spdx.json sbom.json
ls -lA
jq 'try .sbom.packages[]? | {"sbom":{packagename:.name,versionInfo:.versionInfo,licenseDeclared:.licenseDeclared,downloadLocation:.downloadLocation,licenseConcluded:.licenseConcluded,copyrightText:.copyrightText,SPDXID:.SPDXID'}}' sbom.json > sbom_output.json
