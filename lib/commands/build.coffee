userRequire = require('./../util/user-require')
broccoli = userRequire('broccoli')
path = require('path')
rimraf = require('rimraf')
copyDereferenceSync = require('copy-dereference').sync

module.exports = (outputDir = "dist", cb = defaultCb) ->
  try
    process.env['CABBAGE_ENV'] ||= 'production'
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
        handleErr(err, cb)
  catch err
    handleErr(err, cb)

handleErr = (err, builder, cb) ->
  console.error('File: ' + err.file) if err.file?
  console.error(err.stack)
  console.error('\nBuild failed')
  cb(err)

defaultCb = (err) ->
  process.exit(if err then 1 else 0)
