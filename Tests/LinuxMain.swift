import XCTest
@testable import KituraHTTPTestTests

XCTMain([
    testCase(RequestTests.allTests),
    testCase(ResponseRecorderTests.allTests),
])
