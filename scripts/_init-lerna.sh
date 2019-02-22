cd ..
yarn add --dev lerna
echo '{\n  "packages": [\n    "packages/*"\n  ],\n  "version": "0.0.1",\n  "npmClient": "yarn"\n}' > lerna.json
