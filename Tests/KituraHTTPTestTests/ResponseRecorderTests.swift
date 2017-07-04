import XCTest
@testable import KituraNet
@testable import KituraHTTPTest

class ResponseRecorderTests: XCTestCase {
    var responseRecorder: ResponseRecorder?

    public override func setUp() {
        responseRecorder = ResponseRecorder()
    }

    func testInitSetsDefaultStatusCode() {
        XCTAssertEqual(HTTPStatusCode.notImplemented, responseRecorder!.statusCode)
    }

    func testInitSetsDefaultHeaders() {
        var headers = responseRecorder?.headers

        XCTAssertNotNil(headers)
    }

    func testBodyReturnsRecordedBody() {
        responseRecorder!.data = "Test Data".data(using:.utf8)!

        XCTAssertEqual("Test Data", responseRecorder!.body())
    }

    func testJSONBodyReturnsRecordedBodyAsJSON() {
        responseRecorder!.data = "{\"body\":\"Test Data\"}".data(using: .utf8)!
        let json = responseRecorder!.jsonBody()

        XCTAssertEqual("Test Data", json["body"])
    }

    func testEndAppendsToData() throws {
        responseRecorder!.data = "Test Data".data(using:.utf8)!
        try responseRecorder!.end(text: " 123")

        XCTAssertEqual("Test Data 123", responseRecorder!.body())
    }

    func testWriteWithDataAppendsToData() throws {
        responseRecorder!.data = "Test Data".data(using:.utf8)!
        try responseRecorder!.write(from: " 123".data(using: .utf8)!)

        XCTAssertEqual("Test Data 123", responseRecorder!.body())
    }

    func testWriteWithStringAppendsToData() throws {
        responseRecorder!.data = "Test Data".data(using:.utf8)!
        try responseRecorder!.write(from: " 123")

        XCTAssertEqual("Test Data 123", responseRecorder!.body())
    }

    static var allTests = [
        ("testInitSetsDefaultStatusCode", testInitSetsDefaultStatusCode),
        ("testInitSetsDefaultHeaders", testInitSetsDefaultHeaders),
        ("testInitSetsDefaultStatusCode", testBodyReturnsRecordedBody),
        ("testJSONBodyReturnsRecordedBodyAsJSON", testJSONBodyReturnsRecordedBodyAsJSON),
        ("testEndAppendsToData", testEndAppendsToData),
        ("testWriteWithDataAppendsToData", testWriteWithDataAppendsToData),
        ("testWriteWithStringAppendsToData", testWriteWithStringAppendsToData)
    ]
}
