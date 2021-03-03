import XCTest
@testable import RegexForSwift

final class RegexForSwiftTests: XCTestCase {
    
    // MARK: RANGE
    func testRangeOfFirstResult() {
        let reg = Regex.results(regExText: "Hello", targetText: "Hello, world!", caseSensitive: false, diacriticSensitive: false, regexSearch: false)
        XCTAssertTrue(reg.first != nil)
        XCTAssertTrue(reg.first!.range == NSRange(location: 0, length: 5))
    }
    
    // MARK: CASE
    func testCaseInsensitive() {
        let reg = Regex.results(regExText: "heLlo", targetText: "Hello, world!", caseSensitive: false, diacriticSensitive: false, regexSearch: false)
        XCTAssertTrue(reg.count == 1)
    }
    
    func testCaseSensitive() {
        let reg = Regex.results(regExText: "heLlo", targetText: "Hello, world!", caseSensitive: true, diacriticSensitive: false, regexSearch: false)
        XCTAssertTrue(reg.count == 0)
    }
    
    // MARK: DIACRITIC
    func testDiacriticInsensitive() {
        let reg = Regex.results(regExText: "hello", targetText: "héllo, world", caseSensitive: false, diacriticSensitive: false, regexSearch: false)
        XCTAssertTrue(reg.count == 1)
    }
    
    func testDiacriticSensitive() {
        let reg = Regex.results(regExText: "hello", targetText: "héllo, world", caseSensitive: false, diacriticSensitive: true, regexSearch: false)
        XCTAssertTrue(reg.count == 0)
    }
    
    // MARK: REGEX
    func testWithRegexCharacters() {
        let reg = Regex.results(regExText: "h.llo", targetText: "hello, world", caseSensitive: false, diacriticSensitive: false, regexSearch: true)
        XCTAssertTrue(reg.count == 1)
    }
    
    func testWithoutRegexCharacters() {
        let reg = Regex.results(regExText: "h.llo", targetText: "Hello, world!", caseSensitive: false, diacriticSensitive: false, regexSearch: false)
        XCTAssertTrue(reg.count == 0)
    }
}



