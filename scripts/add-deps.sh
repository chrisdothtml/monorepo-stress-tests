DIRNAME=$(dirname "$0")
cd "$DIRNAME/../monorepo-root/packages"
"../../$DIRNAME/_generator.sh" addDeps

# tool-specific
node "../../$DIRNAME/_hoist-deps.js"
