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
