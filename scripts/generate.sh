DIRNAME=$(dirname "$0")
cd "$DIRNAME/../monorepo-root"
rm -rf node_modules
echo '{\n  "private": true\n}' > package.json
cd packages
"../../$DIRNAME/_generator.sh" generate ${1:-500}
