import XCTest
@testable import MusicTheoryKit

final class MusicTheoryKitTests: XCTestCase {
    func testExample() throws {

        XCTAssertEqual(Note.C + Interval.m2, Note.Db)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        
    }
}
