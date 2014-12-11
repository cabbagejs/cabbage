require('coffee-script/register');
module.exports = require('./lib/build-trees');
module.exports.cli = require('./lib/cli');
module.exports.config = require('./lib/get-config')
