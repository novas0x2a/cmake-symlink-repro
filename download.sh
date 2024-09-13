#!/bin/bash

set -xeuo pipefail

VERSION=${1:-3.30.3}

case "$(uname)" in
    Linux)
        SUFFIX=linux-x86_64;;
    Darwin)
        SUFFIX=macos-universal;;
    *)
        echo "Unknown platform" >&2 ;;
esac

curl -o cmake.tar.gz -sSfL "https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}-${SUFFIX}.tar.gz"
mkdir -p "$VERSION"
tar xf cmake.tar.gz -C "$VERSION"
rm -f cmake.tar.gz
