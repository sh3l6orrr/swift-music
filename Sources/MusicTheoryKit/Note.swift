//
//  Note.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/11/21.
//

public enum Note: String {
    case C, Db, D, Eb, E, F, Gb, G, Ab, A, Bb, B
    
    public static func + (_ lhs: Note, _ rhs: Interval) -> Note {
        let sum = lhs.num + rhs.num
        return Note(sum <= 12 ? sum : sum - 12)!
    }
    
    public static func - (_ lhs: Note, _ rhs: Interval) -> Note {
        let difference = lhs.num - rhs.num
        return Note(difference > 0 ? difference : difference + 12)!
    }
    
    public static func - (_ lhs: Note, _ rhs: Note) -> Interval {
        let difference = lhs.num - rhs.num
        return Interval(semitone: difference > 0 ? difference : difference + 12)!
    }
    
    //------------------- Not Part of API --------------------------//
    private init?(_ num: Int) {
        guard let note = Note.intToNote[num] else {
            return nil
        }
        self = note
    }
    
    private var num: Int {
        Note.noteToInt[self]!
    }
    
    private static let noteToInt = [
        C: 1, Db: 2, D: 3, Eb: 4, E: 5, F: 6,
        Gb: 7, G: 8, Ab: 9, A: 10, Bb: 11, B: 12
    ]
    
    private static let intToNote = [
        1: C, 2: Db, 3: D, 4: Eb, 5: E, 6: F,
        7: Gb, 8: G, 9: Ab, 10: A, 11: Bb, 12: B
    ]
}
