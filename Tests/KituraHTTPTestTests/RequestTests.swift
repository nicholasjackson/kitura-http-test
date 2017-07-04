import XCTest
@testable import KituraHTTPTest

class RequestTests: XCTestCase {

    var request: Request?

    public override func setUp() {
        request = Request()
    }

    func testReadAllDataReadsDataFromBody() throws {
        let bodyData = "This is the body".data(using: .utf8)
        var outData = Data()

        request!.body = bodyData!
        try request!.readAllData(into: &outData)

        XCTAssertEqual(bodyData, outData)
    }

    func testReadAllDataReturnsCorrectLength() throws {
        let bodyData = "This is the body".data(using: .utf8)
        var outData = Data()

        request!.body = bodyData!
        var dataLength = try request!.readAllData(into: &outData)

        XCTAssertEqual(bodyData!.count, dataLength)
    }

    func testReadStringReturnsStringFromBody() throws {
        let bodyData = "This is the body".data(using: .utf8)

        request!.body = bodyData!
        var body = try request!.readString()

        XCTAssertEqual(String(data: bodyData!, encoding: .utf8), body)
    }

    func testReadReadsDataFromBody() throws {
        let bodyData = "This is the body".data(using: .utf8)
        var outData = Data()

        request!.body = bodyData!
        try request!.read(into: &outData)

        XCTAssertEqual(bodyData, outData)
    }

    func testReadReturnsCorrectLength() throws {
        let bodyData = "This is the body".data(using: .utf8)
        var outData = Data()

        request!.body = bodyData!
        var dataLength = try request!.read(into: &outData)

        XCTAssertEqual(bodyData!.count, dataLength)
    }

    func testInitSetsDefaultMethod() {
        XCTAssertEqual("GET", request!.method)
    }

    func testInitSetsDefaultHTTPMinorVersion() {
        XCTAssertEqual(1, request!.httpVersionMinor)
    }

    func testInitSetsDefaultHTTPMajorVersion() {
        XCTAssertEqual(1, request!.httpVersionMajor)
    }

    func testInitSetsDefaultRemoteAddress() {
        XCTAssertEqual("localhost", request!.remoteAddress)
    }

    func testInitSetsDefaultUrlURL() {
        XCTAssertEqual(URL(string: "http://localhost/"), request!.urlURL)
    }

    func testInitSetsDefaultURLComponents() {
        XCTAssertNotNil(request!.urlComponents)
    }

    func testInitSetsDefaultURL() {
        XCTAssertNotNil(request!.url)
    }

    func testInitSetsDefaultURLString() {
       XCTAssertEqual("",request!.urlString)
    }

    func testInitSetsDefaultHeaders() {
        XCTAssertNotNil(request!.headers)
    }

    static var allTests = [
        ("testReadAllDataReadsDataFromBody", testReadAllDataReadsDataFromBody),
        ("testReadAllDataReturnsCorrectLength",testReadAllDataReturnsCorrectLength),
        ("testReadStringReturnsStringFromBody",testReadStringReturnsStringFromBody),
        ("testReadReadsDataFromBody", testReadReadsDataFromBody),
        ("testReadReturnsCorrectLength", testReadReturnsCorrectLength),
        ("testInitSetsDefaultMethod", testInitSetsDefaultMethod),
        ("testInitSetsDefaultHTTPMinorVersion", testInitSetsDefaultHTTPMinorVersion),
        ("testInitSetsDefaultHTTPMajorVersion", testInitSetsDefaultHTTPMajorVersion),
        ("testInitSetsDefaultRemoteAddress", testInitSetsDefaultRemoteAddress),
        ("testInitSetsDefaultUrlURL", testInitSetsDefaultUrlURL),
        ("testInitSetsDefaultURLComponents", testInitSetsDefaultURLComponents),
        ("testInitSetsDefaultURL", testInitSetsDefaultURL),
        ("testInitSetsDefaultURLString", testInitSetsDefaultURLString),
        ("testInitSetsDefaultHeaders", testInitSetsDefaultHeaders)
    ]
}
