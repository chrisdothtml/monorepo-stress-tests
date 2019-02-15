# just ensures deps are installed before running
cwd=$(pwd)
cd "$(dirname "$0")/../monorepo-project-generator"
generator_dirname=$(pwd)
yarn --ignore-engines
cd $cwd
"$generator_dirname/generator" "$@"
