Ractive = require 'ractive'
umd = require 'umd-wrapper'
sysPath = require 'path'

module.exports = class RactiveCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'rac'
  pattern: /\.(?:rac|ractive)$/
  # pathReplace = /^.*templates\//

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      result = umd JSON.stringify Ractive.parse data
    catch err
      error = err
    finally
      callback error, result

  # include: [
  #   (sysPath.join __dirname, '..', 'node_modules', 'ractive', 'ractive.runtime.js')
  # ]
