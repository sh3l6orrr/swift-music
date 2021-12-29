//
//  Conversions.swift
//  
//
//  Created by Jin Zhang on 12/20/21.
//

let IntervalToInt: [Interval : Int] = [
    .octave: 0, .m2: 1, .M2: 2, .m3: 3, .M3: 4, .p4: 5,
    .tritone: 6, .p5: 7, .m6: 8, .M6: 9, .m7: 10, .M7: 11
]

let intToInterval: [Int : Interval] = [
    0: .octave, 1: .m2, 2: .M2, 3: .m3, 4: .M3, 5: .p4,
    6: .tritone, 7: .p5, 8: .m6, 9: .M6, 10: .m7, 11: .M7
]

let noteToInt: [Note : Int] = [
    .C: 1, .Db: 2, .D: 3, .Eb: 4, .E: 5, .F: 6,
    .Gb: 7, .G: 8, .Ab: 9, .A: 10, .Bb: 11, .B: 12
]
let intToNote: [Int : Note] = [
    1: .C, 2: .Db, 3: .D, 4: .Eb, 5: .E, 6: .F,
    7: .Gb, 8: .G, 9: .Ab, 10: .A, 11: .Bb, 12: .B
]

let valueToBeats: [Value : Double] = [
    ._128:  0.0078125,
    ._64:  0.015625,
    ._32:  0.03125,
    ._16:  0.0625,
    ._8:  0.125,
    ._4:  0.25,
    ._2:  0.5,
    ._1:  1,
    .v_2:  2,
    .v_4:  4
]

let beatsToValue: [Double: Value] = [
    0.0078125: ._128,
    0.015625: ._64,
    0.03125: ._32,
    0.0625: ._16,
    0.125: ._8,
    0.25: ._4,
    0.5: ._2,
    1: ._1,
    2: .v_2,
    4: .v_4
]
