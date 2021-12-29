//
//  TestInterval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestInterval : XCTestCase {}

extension TestInterval {
    func testIntervalWholeName() throws {
        XCTAssertEqual(Interval.octave.description, "octave")
        XCTAssertEqual(Interval.m6.description, "minor sixth")
    }
    func testCreation() throws {
        XCTAssertNotNil(Interval(semitone: 9031))
        XCTAssertNil(Interval(semitone: -4))
    }
}

