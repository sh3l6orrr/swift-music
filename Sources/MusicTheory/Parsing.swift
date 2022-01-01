//
//  Parsing.swift
//  
//
//  Created by Jin Zhang on 12/31/21.
//

extension String {
    mutating func parseNote() -> Note? {
        var found: Note?
        for noteName in Note.allCases.map(\.description) {
            if self.hasPrefix(noteName) {
                if noteName.count == 1 {
                    found = Note(noteName)!
                } else {
                    self = .init(self.dropFirst(noteName.count))
                    return Note(noteName)!
                }
            }
        }
        self = .init(self.dropFirst())
        return found
    }
}
