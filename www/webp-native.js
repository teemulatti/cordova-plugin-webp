var exec = require('cordova/exec')

exports.decodeWebp = function decodeWebp (path, s, f) {
  loga("decoding 1");
  exec(s, f, 'WebPPlugin', 'decodeWebp', [path])
  loga("decoding 2");
}
