import XCTest
@testable import TiledResources

final class TiledResourcesTests: XCTestCase {
    func testGenericTiledProject() {
        do {
            XCTAssertTrue(try Projects.genericTiled.url.checkPromisedItemIsReachable())
        } catch {
            XCTFail("Test failed: \(error)")
        }
    }

    static var allTests = [
        ("testExample", testGenericTiledProject),
    ]
}
