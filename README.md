spotify_control
===============

A set of shell scripts for controlling a local desktop Spotify client.

Dependencies
------------
- Spotify desktop client - https://www.spotify.com
- `curl` - https://curl.haxx.se/
- `jq` - https://stedolan.github.io/jq/

Usage
-----
* Play a track, album, artist, or playlist given its Spotify URI: `./spotify_control.sh play <SPOTIFY_URI>`
  * The Spotify URI can be found by right-clicking on an item and selecting
    "Share" then "Copy Spotify URI" from the context-menu.
  * Example: `./spotify_control.sh play spotify:track:7AL6qzIDHIX7pEUWrzNiIs`
* Pause a currently playing track, or unpause a paused track: `./spotify_control.sh pause`
* Show information on the currently playing track: `./spotify_control.sh status`
