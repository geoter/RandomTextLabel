import XCTest
@testable import RandomTextLabel

final class RandomTextLabelTests: XCTestCase {
    func testExample() throws {
        UILabel.randomText()
        let label = UILabel()
        let initialText = "non random text"
        label.text = initialText
        XCTAssertNotNil(label.text)
        print("Random text \(label.text!)")
        XCTAssertNotEqual(label.text, initialText) //a random text must have been assigned
    }
}
