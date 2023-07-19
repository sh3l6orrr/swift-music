var nameToInterval: [String : Interval] = [
    "octave"            :.octave ,
    "minor second"      :.m2     ,
    "major second"      :.M2     ,
    "minor third"       :.m3     ,
    "major third"       :.M3     ,
    "perfect fourth"    :.p4     ,
    "tritone"           :.tritone,
    "perfect fifth"     :.p5     ,
    "minor sixth"       :.m6     ,
    "major sixth"       :.M6     ,
    "minor seventh"     :.m7     ,
    "major seventh"     :.M7     
]

var semitoneToInterval: [Int : Interval] = [
    0  :.octave ,
    1  :.m2     ,
    2  :.M2     ,
    3  :.m3     ,
    4  :.M3     ,
    5  :.p4     ,
    6  :.tritone,
    7  :.p5     ,
    8  :.m6     ,
    9  :.M6     ,
    10 :.m7     ,
    11 :.M7     
]

var modeToIntervals: [Mode : [Interval]] = [
    .major :            [.octave, .M2, .M3, .p4, .p5, .M6, .M7],
    .minor :            [.octave, .M2, .m3, .p4, .p5, .m6, .m7]
//    .ionian :           [.octave, .M2, .M3, .p4, .p5, .M6, .M7],
//    .aeolian :          [.octave, .M2, .m3, .p4, .p5, .m6, .m7],
//    .melodicMinor :     [.octave, .M2, .m3, .p4, .p5, .M6, .M7],
//    .harmoicMinor :     [.octave, .M2, .m3, .p4, .p5, .m6, .M7],
//    .pentatonic :       [.octave, .M2, .M3, .p5, .M6],
//    .minorPentatonic :  [.octave, .M2, .m3, .p5, .m6],
//    .blues:             [.octave, .M2, .m3, .M3, .p5, .M6]
]

var nameToNote: [String : Note] = [
    "C"    :  .C    ,
    "C#"   :  .CD   ,
    "Db"   :  .CD   ,
    "D"    :  .D    ,
    "D#"   :  .DE   ,
    "Eb"   :  .DE   ,
    "E"    :  .E    ,
    "F"    :  .F    ,
    "F#"   :  .FG   ,
    "Gb"   :  .FG   ,
    "G"    :  .G    ,
    "G#"   :  .GA   ,
    "Ab"   :  .GA   ,
    "A"    :  .A    ,
    "A#"   :  .AB   ,
    "Bb"   :  .AB   ,
    "B"    :  .B    
]

var qualityToIntervals: [Quality : [Interval]]  = [
    .power:                           [.octave, .p5],
    .suspended2ndTriad:               [.octave, .M2, .p5],
    .diminishedTriad:                 [.octave, .m3, .tritone],
    .minorTriad:                      [.octave, .m3, .p5],
    .majorTriad:                      [.octave, .M3, .p5],
    .augmentedTriad:                  [.octave, .M3, .m6],
    .suspended4thTriad:               [.octave, .p4, .p5],
    .diminishedSeventh:               [.octave, .m3, .tritone, .M6],
    .halfDiminishedSeventh:           [.octave, .m3, .tritone, .m7],
    .dominantSeventhWithFlat5th:      [.octave, .M3, .tritone, .m7],
    .minorSixth:                      [.octave, .m3, .p5, .M6],
    .majorSixth:                      [.octave, .M3, .p5, .M6],
    .minorMajorSeventh:               [.octave, .m3, .p5, .M7],
    .augmentedSeventh:                [.octave, .M3, .m6, .m7],
    .dominantSeventhWithSuspended4th: [.octave, .p4, .p5, .m7],
    .minorTriadAdded9th:              [.octave, .M2, .m3, .p5],
    .majorTriadAdded9th:              [.octave, .M2, .M3, .p5],
    .minorTriadAdded11th:             [.octave, .m3, .p4, .p5],
    .majorTriadAdded11th:             [.octave, .M3, .p4, .p5],
    .minorSeventh:                    [.octave, .m3, .p5, .m7],
    .dominantSeventh:                 [.octave, .M3, .p5, .m7],
    .majorSeventh:                    [.octave, .M3, .p5, .M7],
    .minorNinth:                      [.octave, .M2, .m3, .p5, .m7],
    .dominantNinth:                   [.octave, .M2, .M3, .p5, .m7],
    .majorNinth:                      [.octave, .M2, .M3, .p5, .M7]
]

var nameToQuality: [String : Quality] = [
    "5":     .power,
    "sus2":  .suspended2ndTriad,
    "dim":   .diminishedTriad,
    "m":     .minorTriad,
    "":      .majorTriad,
    "aug":   .augmentedTriad,
    "sus4":  .suspended4thTriad,
    "dim7":  .diminishedSeventh,
    "m7b5":  .halfDiminishedSeventh,
    "7-5":   .dominantSeventhWithFlat5th,
    "m6":    .minorSixth,
    "6":     .majorSixth,
    "mMaj7": .minorMajorSeventh,
    "aug7":  .augmentedSeventh,
    "7sus4": .dominantSeventhWithSuspended4th,
    "madd9": .minorTriadAdded9th,
    "add9":  .majorTriadAdded9th,
    "madd11":.minorTriadAdded11th,
    "add11": .majorTriadAdded11th,
    "m7":    .minorSeventh,
    "7":     .dominantSeventh,
    "maj7":  .majorSeventh,
    "m9":    .minorNinth,
    "9":     .dominantNinth,
    "maj9":  .majorNinth
]
