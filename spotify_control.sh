#!/bin/sh

PORT=`./find_port.sh`

if [ -e csrf ]
then
    CSRF=`cat csrf`
else
    CSRF=`./get_csrf.sh $PORT`
    echo $CSRF > csrf
fi

if [ -e oauth_token ]
then
    OAUTH=`cat oauth_token`
else
    OAUTH=`./get_oauth.sh`
    echo $OAUTH > oauth_token
fi

ACTION=$1
CONTEXT=$2

PAUSE_TRUE="&pause=true"
PAUSE_FALSE="&pause=false"

URL=`cat url_template.txt \
    | sed "s/__PORT__/$PORT/g" \
    | sed "s/__ACTION__/$ACTION/g" \
    | sed "s/__CSRF__/$CSRF/g" \
    | sed "s/__OAUTH__/$OAUTH/g" \
    | sed "s/__CONTEXT__/$CONTEXT/"`

if [ $ACTION == "pause" ]
then
    if [ -e "is_paused" ]
    then
        URL="$URL$PAUSE_FALSE"
    else
        URL="$URL$PAUSE_TRUE"
    fi
fi

RESPONSE=`curl --silent $URL`

PLAYING=`echo $RESPONSE | jq ".playing"`
if [ $PLAYING == "true" ]
then
    rm -f is_paused
else
    touch is_paused
fi

echo $RESPONSE | jq ".track |
    {
      track: .track_resource.name,
      artist: .artist_resource.name,
      album: .album_resource.name,
      track_uri: .track_resource.uri,
      album_uri: .album_resource.uri,
      artist_uri: .artist_resource.uri
    }"
