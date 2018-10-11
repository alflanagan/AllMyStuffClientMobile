#!/usr/bin/env bash

# sometimes the build gets in some sort of "broken" state and we get weird errors with
# `react-native run-android`. This (usually) clears the problem up.
watchman watch-del-all
rm -rf node_modules && yarn
rm -rf /tmp/haste-map-react-native-packager-*
cd android || exit
./gradlew clean
cd ..
react-native start -- --reset-cache > web_server.log 2>&1 &
