# monorepo-stress-tests

> Comparing various monorepo tooling

## Try it out

### 1. Clone this repo

```sh
# make sure to include the bit about submodules
git clone --recurse-submodules git@github.com:chrisdothtml/monorepo-stress-tests.git
```

### 2. Checkout the branch of a tool to test

```sh
# options:
# - lerna
# - manual
# - rush
# - workspaces
git checkout <tool-name>
```

### 3. Generate the fixture packages

***Note***: this should be run every time you switch branches as they each tool has its own custom generation scripts

```sh
./scripts/generate.sh

# if you want to specify a number of packages to generate
# (defaults to 500)
./scripts/generate.sh 100
```
