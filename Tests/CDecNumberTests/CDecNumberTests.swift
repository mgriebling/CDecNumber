import XCTest
@testable import CDecNumber

final class CDecNumberTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
 //       XCTAssertEqual(CDecNumber().text, "Hello, World!")
        var c = decContext()
        var s = [CChar](repeating: 0, count: 32)
        decContextDefault(&c, DEC_INIT_BASE)
        c.traps = 0
        c.round = DEC_ROUND_HALF_UP
        
        var a = decNumber(), b = decNumber(), d = decNumber()
        c.digits = 15
        decNumberFromString(&a, "111111111111", &c)
        decNumberFromString(&b, "111111111", &c)
        c.digits = 9
        decNumberXor(&d, &a, &b, &c)
        decNumberToString(&d, &s)
        print(String(cString: s))
    }
}
