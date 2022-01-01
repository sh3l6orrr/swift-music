@testable import MusicTheory

var s = ["22", "33"]
s.removeFirst()
s.removeFirst()

"fsdfsd".dropFirst()
var a = "Bb/sus2"
a.parseNote()

try Chord("F")
try! Chord("Dbm").isIn(scale: .init(.B, .major))
let Esus4 = Chord(.E, [.E, .A, .B])
