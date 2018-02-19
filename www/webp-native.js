var exec = require('cordova/exec')

exports.decodeWebp = function decodeWebp (s, f) {
  exec(s, f, 'WebpPlugin', 'decodeWebp', [path])
}
