DIRNAME=$(dirname "$0")
cd "$DIRNAME/../monorepo-root"
echo '{\n  "private": true\n}' > package.json
cd packages
"../../$DIRNAME/_generator.sh" generate ${1:-500}
