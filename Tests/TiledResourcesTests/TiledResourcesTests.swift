import XCTest
@testable import TiledResources

final class TiledResourcesTests: XCTestCase {
    func testGenericTiledProject() {
        XCTAssertTrue(try TiledResources.GenericTiledProject.projectFile.url.checkPromisedItemIsReachable())
    }

    static var allTests = [
        ("testExample", testGenericTiledProject),
    ]
}
