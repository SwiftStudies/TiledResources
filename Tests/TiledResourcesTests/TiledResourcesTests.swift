import XCTest
@testable import TiledResources
import Foundation

final class TiledResourcesTests: XCTestCase {
    
    func testResourceAllCapturedInAPI(){
        let allResources = TiledResources().allResources
        guard let enumerator = FileManager.default.enumerator(at: TiledResources.url, includingPropertiesForKeys: nil) else {
            return XCTFail("Could not enumerate path \(TiledResources.url.path)")
        }

        var enumeratedCount = 0
        while let file = enumerator.nextObject() as? URL{
            if file.lastPathComponent.hasSuffix(".DS_Store") || file.pathComponents[TiledResources.url.pathComponents.count] == "Asset Sources" || file.pathExtension == "tiled-session" || file.pathExtension == "swift" {
                continue
            }
            enumeratedCount += 1
            
            XCTAssertTrue(allResources.contains(file),"\(file.path) not captured in TiledResources API")
        }
        
        XCTAssertGreaterThan(enumeratedCount, 1)
    }
    
    func testResourceExistence() {
        
        for resource in TiledResources().allResources {
            XCTAssertTrue(try resource.checkResourceIsReachable())            
        }        
    }

    static var allTests = [
        ("testResourceExistence", testResourceExistence),
    ]
}
