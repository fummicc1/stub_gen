#!/bin/bash

set -e

echo "Publishing to pub.dev..."

fvm flutter pub publish --dry-run

if [ $? -eq 0 ]; then
    echo "Publishing to pub.dev..."
    fvm flutter pub publish
fi

