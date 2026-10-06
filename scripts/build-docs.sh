#!/usr/bin/env bash
# Build the SPOT-SG documentation page with Widoco into ./docs
# Used locally and by .github/workflows/docs.yml. Requires Java 17+ and curl.
set -euo pipefail

WIDOCO_VERSION="${WIDOCO_VERSION:-1.4.25}"
ONTOLOGY="ontology/spot-sg.ttl"
OUT="docs"

cd "$(dirname "$0")/.."

JAR=".cache/widoco-${WIDOCO_VERSION}.jar"
if [ ! -s "$JAR" ]; then
  mkdir -p .cache
  curl -fsSL -o "$JAR" \
    "https://github.com/dgarijo/Widoco/releases/download/v${WIDOCO_VERSION}/widoco-${WIDOCO_VERSION}-jar-with-dependencies_JDK-17.jar"
fi

rm -rf "$OUT"
java -jar "$JAR" \
  -ontFile "$ONTOLOGY" \
  -outFolder "$OUT" \
  -confFile widoco/config.properties \
  -getOntologyMetadata \
  -uniteSections \
  -rewriteAll \
  -noPlaceHolderText \
  -excludeProvenance \
  -lang en

# Widoco does not reliably signal failure through its exit code.
test -s "$OUT/index-en.html" || { echo "Widoco produced no index-en.html" >&2; exit 1; }

# Images referenced by the hand-written sections
mkdir -p "$OUT/assets"
cp assets/* "$OUT/assets/"

cp "$OUT/index-en.html" "$OUT/index.html"
rm -f "$OUT/readme.md"
echo "Built $OUT/index.html"
