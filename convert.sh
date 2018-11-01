#!/bin/bash
# File that goes inside docker image todo the conversion

TMPFILE=$(mktemp api-doc.XXXXXX) || exit 1
trap "{ rm -f $TMPFILE; }" EXIT

curl -s https://${HOST}/doc/api/api-docs.json |\
  jq --arg host "https://$HOST/doc/api/" '. + {basePath: $host}' > $TMPFILE

api-spec-converter -c -f swagger_1 -t swagger_2 $TMPFILE

