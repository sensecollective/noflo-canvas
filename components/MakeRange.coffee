noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.description = 'Make an array of evenly-spaced numbers'
  c.icon = 'folder-o'
  c.inPorts.add 'from',
    datatype: 'number'
  c.inPorts.add 'to',
    datatype: 'number'
  c.inPorts.add 'count',
    datatype: 'int'
  c.outPorts.add 'range',
    datatype: 'array'
  c.process (input, output) ->
    return unless input.hasData 'from', 'to', 'count'
    [from, to, count] = input.getData 'from', 'to', 'count'
    if count is 1
      output.sendDone
        range: [from]
      return
    range = []
    f = from
    spread = to - from
    increment = spread / (count-1)
    for i in [0..count-1]
      range[i] = from + increment*i
    output.sendDone
      range: range
