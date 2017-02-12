#!/bin/bash

# usage: agree-license.sh filename hash
# example: agree-license.sh android-sdk-license 1234567890123456789012345678901234567890

D="${ANDROID_HOME}/licenses"
F="$D/$1"

mkdir -p "$D"
echo '' > "$F"
echo -n "$2" >> "$F"
