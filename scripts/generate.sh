DIRNAME=$(dirname "$0")
cd "$DIRNAME/../packages"
"../$DIRNAME/_generator.sh" generate ${1:-500}
