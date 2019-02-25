DIRNAME=$(dirname "$0")
cd "$DIRNAME/../monorepo-root"

# reset monorepo
rm -rf *
touch .gitkeep
mkdir packages
touch packages/.gitkeep
echo '{\n  "private": true\n}' > package.json

# generate benchmark packages
cd packages
"../../$DIRNAME/_generator.sh" generate ${1:-500}
