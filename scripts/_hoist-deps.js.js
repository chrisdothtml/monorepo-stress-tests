const path = require('path')
const fse = require('fs-extra')

const ROOT_PKG_PATH = path.resolve(process.cwd(), '../package.json')

async function main () {
  const rootPkgJson = require(ROOT_PKG_PATH)
  const pkgNames = (await fse.readdir('.'))
    .filter(filename => !/^\./.test(filename))
  const depCollection = {
    dependencies: {},
    devDependencies: {}
  }

  await Promise.all(
    pkgNames.map(async (pkgName) => {
      const pkgJsonPath = path.join(pkgName, 'package.json')
      const pkgJson = JSON.parse(await fse.readFile(pkgJsonPath, 'utf-8'))

      for (const key of Object.keys(depCollection)) {
        const pkgDeps = pkgJson[key]

        if (pkgDeps) {
          for (const depName of Object.keys(pkgDeps)) {
            if (!depCollection[key][depName] && !pkgNames.includes(depName)) {
              depCollection[key][depName] = pkgDeps[depName]
            }

            delete pkgDeps[depName]
          }

          delete pkgJson[key]
        }
      }

      await fse.writeFile(pkgJsonPath, JSON.stringify(pkgJson, null, 2))
    })
  )

  for (const key of Object.keys(depCollection)) {
    rootPkgJson[key] = rootPkgJson[key] || {}
    Object.assign(rootPkgJson[key], depCollection[key])
  }

  await fse.writeFile(ROOT_PKG_PATH, JSON.stringify(rootPkgJson, null, 2))
}

main().catch(console.error)
