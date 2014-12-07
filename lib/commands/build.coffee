broccoli = require(require('resolve').sync('broccoli', basedir: process.cwd()))
path = require('path')
rimraf = require('rimraf')
copyDereferenceSync = require('copy-dereference').sync

module.exports = (outputDir = "dist", cb = defaultCb) ->
  process.env['CABBAGE_ENV'] = 'production'
  rimraf.sync(path.resolve(process.cwd(), outputDir))
  builder = new broccoli.Builder(broccoli.loadBrocfile())
  builder.build()
    .then (hash) ->
      copyDereferenceSync(hash.directory, outputDir)
    .finally ->
      builder.cleanup()
    .then ->
      cb(null)
    .catch (err) ->
      # Should show file and line/col if present
      console.error('File: ' + err.file) if err.file?
      console.error(err.stack)
      console.error('\nBuild failed')
      cb(err)

defaultCb = (err) ->
  if err
    process.exit(1)
  else
    process.exit(0)
