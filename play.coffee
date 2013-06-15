midi = require 'midi'
fs = require 'fs'

output = new midi.output
pCount = output.getPortCount()

console.log "Available MIDI ports:", pCount
for p in [0...pCount]
  console.log "  -", output.getPortName(p)

output.openPort 0

outStream = midi.createWriteStream output
inStream = fs.createReadStream 'nocturne.mid'

inStream.pipe outStream
