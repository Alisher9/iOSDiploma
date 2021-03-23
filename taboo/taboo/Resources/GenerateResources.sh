/bin/sh

RSROOT=$SRCROOT/taboo/Resources

"$PODS_ROOT/Swiftgen/bin/swiftgen" \
xcassets -t swift5 "$RSROOT/Assets.xcassets" \
--output "$RSROOT/Asset+Generated.swift"

