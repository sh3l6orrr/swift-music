@testable import MusicTheory

try Chord("F")
try Chord("Dbm").isIn(scale: .init(.B, .major))
let Esus4 = Chord(root: .E, [.E, .A, .B])
