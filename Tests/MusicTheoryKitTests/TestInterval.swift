//
//  TestInterval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestInterval: XCTestCase {
    
    func testIntervalWholeName() throws {
        XCTAssertEqual(Interval.octave.wholeName, "octave")
        XCTAssertEqual(Interval.m6.wholeName, "minor sixth")
    }
    
    func testCreation() throws {
        XCTAssertNotNil(Interval(semitone: 9031))
        XCTAssertNil(Interval(semitone: -4))
    }
    
}
