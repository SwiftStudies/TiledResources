import XCTest
@testable import TiledResources

final class TiledResourcesTests: XCTestCase {
    
    func testResourceExistence() {
        
        for item in TiledResources.GenericTiledProject.Maps.allCases {
            XCTAssertTrue(try item.url.checkResourceIsReachable())
        }
        for item in TiledResources.GenericTiledProject.TileSets.allCases {
            XCTAssertTrue(try item.url.checkResourceIsReachable())
        }
        for item in TiledResources.SpriteKit.Maps.allCases {
            XCTAssertTrue(try item.url.checkResourceIsReachable())
        }
        for item in TiledResources.SpriteKit.TileSets.allCases {
            XCTAssertTrue(try item.url.checkResourceIsReachable())
        }
    }

    static var allTests = [
        ("testResourceExistence", testResourceExistence),
    ]
}
