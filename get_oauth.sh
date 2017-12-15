#!/bin/bash

curl --silent https://open.spotify.com/token | jq ".t" | sed "s/\"//g"
