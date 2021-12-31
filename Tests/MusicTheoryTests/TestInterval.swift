//
//  TestInterval.swift
//  MusicTheory
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheory

final class TestInterval: XCTestCase {}

extension TestInterval {
    func testIntervalWholeName() throws {
        XCTAssertEqual(Interval.octave.description, "octave")
        XCTAssertEqual(Interval.m6.description, "minor sixth")
    }
    func testCreation() throws {
        XCTAssertNotNil(Interval(semitone: 9031))
        XCTAssertNil(Interval(semitone: -4))
    }
    func testConsonance() throws {
        XCTAssertTrue(Interval.m3.isConsonant)
        XCTAssertTrue(Interval.p5.isConsonant)
        XCTAssertTrue(Interval.octave.isConsonant)
    }
}

