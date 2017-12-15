#!/bin/bash

curl --silent -H @headers.txt http://127.0.0.1:$1/simplecsrf/token.json | jq ".token" | sed "s/\"//g"
