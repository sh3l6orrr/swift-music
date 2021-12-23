//
//  ChordReference.swift
//  
//
//  Created by Jin Zhang on 12/20/21.
//

let semitonesToQuality: [[Interval] : String] = [
    [Interval.p5] : "5",
    [Interval.M2, Interval.p5]: "sus2",
    [Interval.m3, Interval.tritone]: "dim",
    [Interval.m3, Interval.p5]: "m",
    [Interval.M3, Interval.p5]: "",
    [Interval.M3, Interval.m6]: "aug",
    [Interval.p4, Interval.p5]: "sus4",
    
    [Interval.m3, Interval.tritone, Interval.M6]: "dim7",
    [Interval.m3, Interval.tritone, Interval.m7]: "m7b5",
    [Interval.M3, Interval.tritone, Interval.m7]: "7-5",
    
    [Interval.m3, Interval.p5, Interval.M6]: "m6",
    [Interval.M3, Interval.p5, Interval.M6]: "6",
    
    [Interval.m3, Interval.p5, Interval.M7]: "mMaj7",
    [Interval.M3, Interval.m6, Interval.m7]: "aug7",
    [Interval.p4, Interval.p5, Interval.m7]: "7sus4",
    
    [Interval.M2, Interval.M3, Interval.p5]: "add9",
    [Interval.M3, Interval.p4, Interval.p5]: "add11",
    
    [Interval.m3, Interval.p5, Interval.m7]: "m7",
    [Interval.M3, Interval.p5, Interval.m7]: "7",
    [Interval.M3, Interval.p5, Interval.M7]: "maj7",
    
    [Interval.M2, Interval.m3, Interval.p5, Interval.m7]: "m9",
    [Interval.M2, Interval.M3, Interval.p5, Interval.m7]: "9",
    [Interval.M2, Interval.M3, Interval.p5, Interval.M7]: "maj9",
    
    [Interval.M2, Interval.m3, Interval.p4, Interval.p5, Interval.m7]: "m11",
    [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.m7]: "11",
    [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M7]: "maj11",
    
    [Interval.M2, Interval.m3, Interval.p4, Interval.p5, Interval.M6, Interval.m7]: "m13",
    [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M6, Interval.m7]: "13",
    [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M6, Interval.M7]: "maj13",
]

