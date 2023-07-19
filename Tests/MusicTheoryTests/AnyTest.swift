import XCTest
@testable import MusicTheory

class AnyTest: XCTestCase {

    func testQuality() throws {
        print(Chord(.DE, .minorTriad).isIn(scale: Scale(.B, .major)))
    }
    func bnyTest() throws {
        XCTAssert(Chord(.DE, .minorTriad).isIn(scale: Scale(.B, .major)))
    }
}
