//
//  ChordReference.swift
//  
//
//  Created by Jin Zhang on 12/20/21.
//

let semitonesToQuality: [[Interval] : String] = [
    [.p5] : "5",
    [.M2, .p5]: "sus2",
    [.m3, .tritone]: "dim",
    [.m3, .p5]: "m",
    [.M3, .p5]: "",
    [.M3, .m6]: "aug",
    [.p4, .p5]: "sus4",
    
    [.m3, .tritone, .M6]: "dim7",
    [.m3, .tritone, .m7]: "m7b5",
    [.M3, .tritone, .m7]: "7-5",
    
    [.m3, .p5, .M6]: "m6",
    [.M3, .p5, .M6]: "6",
    
    [.m3, .p5, .M7]: "mMaj7",
    [.M3, .m6, .m7]: "aug7",
    [.p4, .p5, .m7]: "7sus4",
    
    [.M2, .M3, .p5]: "add9",
    [.M3, .p4, .p5]: "add11",
    
    [.m3, .p5, .m7]: "m7",
    [.M3, .p5, .m7]: "7",
    [.M3, .p5, .M7]: "maj7",
    
    [.M2, .m3, .p5, .m7]: "m9",
    [.M2, .M3, .p5, .m7]: "9",
    [.M2, .M3, .p5, .M7]: "maj9",
    
    [.M2, .m3, .p4, .p5, .m7]: "m11",
    [.M2, .M3, .p4, .p5, .m7]: "11",
    [.M2, .M3, .p4, .p5, .M7]: "maj11",
    
    [.M2, .m3, .p4, .p5, .M6, .m7]: "m13",
    [.M2, .M3, .p4, .p5, .M6, .m7]: "13",
    [.M2, .M3, .p4, .p5, .M6, .M7]: "maj13",
]

