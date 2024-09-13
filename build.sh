#!/bin/bash

set -euo pipefail

ROOTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRCDIR=$ROOTDIR/src

if [[ -z ${CMAKE:-} ]]; then
    CMAKE=$(find "$ROOTDIR"/3.30.3 -name bin)/cmake
fi

echo "=============================="
echo "SRCDIR is $SRCDIR"
echo "CMAKE is $CMAKE"
echo "=============================="

for dst in $ROOTDIR/one $ROOTDIR/depth/2; do
    echo "=============================="
    echo "= Building in $dst"
    echo "=============================="

    rm -rf "$dst"
    $CMAKE -B"$dst" -S"$SRCDIR" >/dev/null
    ls -logh "$dst"
done
