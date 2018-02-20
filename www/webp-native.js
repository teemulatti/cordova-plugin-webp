// Teemu Lätti

var exec = require('cordova/exec')

exports.decodeWebp = function decodeWebp (path, s, f) {
  exec(s, f, 'WebPPlugin', 'decodeWebp', [path])
}
