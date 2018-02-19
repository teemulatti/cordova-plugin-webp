var exec = require('cordova/exec')

exports.decodeWebp = function decodeWebp (path, s, f) {
  exec(s, f, 'WebpPlugin', 'decodeWebp', [path])
}
