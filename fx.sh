#!/usr/bin/env bash

if [ "$GITHUB_ACTIONS" == "true" ]; then
  echo actions building ...
fi

if [ -z "$MOZBUILD_STATE_PATH" ]; then
    echo "MOZBUILD_STATE_PATH not define"
elif [ -d "$MOZBUILD_STATE_PATH" ]; then
    echo "ls -la $MOZBUILD_STATE_PATH"
    ls $MOZBUILD_STATE_PATH -la
fi
