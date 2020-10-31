//    Copyright 2020 Swift Studies
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

import Foundation

#warning("Temporary Solution until https://bugs.swift.org/browse/SR-13714 is fixed and I can reference TiledResources from here")
import Foundation

public protocol Resource {
    var url : URL { get }
}

public protocol ProjectResource : Resource {
    var project : Resource { get }
}

public protocol MapResource : ProjectResource {
    
}

public protocol TilesetRespource : ProjectResource {
    
}

public protocol ResourceContainer : Resource {
    var contents : [Resource] { get }
}

public protocol StaticResource : Resource {
    static var url : URL { get }
}

public protocol StaticResourceContainer : StaticResource, ResourceContainer {
    static var contents : [Resource] { get }
}

public extension StaticResource {
    var url : URL {
        return Self.url
    }
}

public extension StaticResourceContainer {
    var contents : [Resource] {
        return Self.contents
    }
}

public struct ResourceInstance : Resource {
    public var url : URL
}

public struct ProjectResourceInstance : ProjectResource {
    public var url : URL
    public var project : Resource
}


public struct TiledResources : StaticResourceContainer {
    public static var url = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
    public static var contents : [Resource] = [SpriteKit(), GenericTiledProject()]
    
    public struct GenericTiledProject : StaticResourceContainer {
        public static var url = TiledResources.url.appendingPathComponent("Generic Tiled Project")
        public static var contents : [Resource] = [
            projectFile, 
            objectTypesFile,
            Images(),
            Tilesets(),
            Maps(),
        ]

        public static var projectFile = ResourceInstance(url: Self.url.appendingPathComponent("Generic Tiled Project.tiled-project"))
        public static var objectTypesFile = ResourceInstance(url: Self.url.appendingPathComponent("Object Types.xml"))
        
        public struct Images : StaticResourceContainer {
            public static var url = GenericTiledProject.url.appendingPathComponent("Images")
            public static var contents : [Resource] = [
                topDownMarginAndSpacing, 
                topDownMargin, 
                topDown, 
                a, b, c, d, e, f,
                animation, 
                isometric, 
                testCard16x16,
            ]
            static let topDownMarginAndSpacing = ResourceInstance(url:Images.url.appendingPathComponent("2D Top Down - 2px Margin and Spacing.png"))
            static let topDownMargin = ResourceInstance(url:Images.url.appendingPathComponent("2D Top Down - Margin 2.png"))
            static let topDown = ResourceInstance(url:Images.url.appendingPathComponent("2D Top Down.png"))
            static let a = ResourceInstance(url:Images.url.appendingPathComponent("A.png"))
            static let b = ResourceInstance(url:Images.url.appendingPathComponent("B.png"))
            static let c = ResourceInstance(url:Images.url.appendingPathComponent("C.png"))
            static let d = ResourceInstance(url:Images.url.appendingPathComponent("D.png"))
            static let e = ResourceInstance(url:Images.url.appendingPathComponent("E.png"))
            static let f = ResourceInstance(url:Images.url.appendingPathComponent("F.png"))
            static let animation = ResourceInstance(url:Images.url.appendingPathComponent("Animation.png"))
            static let isometric = ResourceInstance(url:Images.url.appendingPathComponent("Isometric.png"))
            static let testCard16x16 = ResourceInstance(url:Images.url.appendingPathComponent("Test Card 16x16.png"))
        }
        
        public struct Tilesets : StaticResourceContainer {
            public static var url = GenericTiledProject.url.appendingPathComponent("Tilesets")
            public static var contents : [Resource] = [
                alphabet, 
                animation, 
                singleTile, 
                isometric,
                topDownNoMarginNoSpacing, 
                topDownMarginNoSpacing,
                topDownMarginAndSpacing,
            ]
            static let alphabet = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Alphabet.tsx"), project: GenericTiledProject())
            static let animation = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Animation.tsx"), project: GenericTiledProject())
            static let isometric = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Isometric.tsx"), project: GenericTiledProject())
            static let singleTile = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Single Tile.tsx"), project: GenericTiledProject())
            static let topDownNoMarginNoSpacing = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Top Down [Sheet M-0 S-0].tsx"), project: GenericTiledProject())
            static let topDownMarginNoSpacing = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Top Down [Sheet M-2 S-0].tsx"), project: GenericTiledProject())
            static let topDownMarginAndSpacing = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Top Down [Sheet M-2 S-2].tsx"), project: GenericTiledProject())
        }
        
        public struct Maps : StaticResourceContainer {
            public static var url = GenericTiledProject.url.appendingPathComponent("Maps")
            public static var contents : [Resource] = [
                topDown,
                base64, 
                base64zlib, 
                base64standard,
                isometric,
                oneOfEverything,
                testMap1,
                testMap2,
                testMap3,
            ]
            static let topDown = ProjectResourceInstance(url:Maps.url.appendingPathComponent("2D Top Down.tmx"), project: GenericTiledProject())
            static let base64 = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Base64.tmx"), project: GenericTiledProject())
            static let base64zlib = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Base64zlib.tmx"), project: GenericTiledProject())
            static let base64standard = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Base64zstandard.tmx"), project: GenericTiledProject())
            static let isometric = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Isometric.tmx"), project: GenericTiledProject())
            static let oneOfEverything = ProjectResourceInstance(url:Maps.url.appendingPathComponent("One of Everything.tmx"), project: GenericTiledProject())
            static let testMap1 = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Test Map 1.tmx"), project: GenericTiledProject())
            static let testMap2 = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Test Map 2.tmx"), project: GenericTiledProject())
            static let testMap3 = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Test Map 3.tmx"), project: GenericTiledProject())
        }        
    }
    
    public struct SpriteKit : StaticResourceContainer {
        public static var url = TiledResources.url.appendingPathComponent("SpriteKit")
        public static var contents : [Resource] = [
            projectFile, 
            objectTypesFile,
            Images(),
            Tilesets(),
            Maps(),
        ]
        
        public static var projectFile = ResourceInstance(url: Self.url.appendingPathComponent("SpriteKit.tiled-project"))
        public static var objectTypesFile = ResourceInstance(url: Self.url.appendingPathComponent("ObjectTypes.xml"))
        
        public struct Images : StaticResourceContainer {
            public static var url = SpriteKit.url.appendingPathComponent("Images")
            public static var contents : [Resource] = [
                dungeonTiles
            ]
            
            static let dungeonTiles = ResourceInstance(url:Images.url.appendingPathComponent("DungeonTiles.png")) 
        }
        
        public struct Tilesets : StaticResourceContainer {
            public static var url = SpriteKit.url.appendingPathComponent("Tilesets")
            public static var contents : [Resource] = [
                dungeon,
            ]            
            
            static let dungeon = ProjectResourceInstance(url:Tilesets.url.appendingPathComponent("Dungeon.tsx"), project: SpriteKit()) 
        }
        
        public struct Maps : StaticResourceContainer {
            public static var url = SpriteKit.url.appendingPathComponent("Maps")
            public static var contents : [Resource] = [
                lightTest, 
                readyPlayerOne, 
                topDownScroller,
            ]            
            
            static let lightTest = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Light Test.tmx"), project: SpriteKit()) 
            static let readyPlayerOne = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Ready Player 1.tmx"), project: SpriteKit()) 
            static let topDownScroller = ProjectResourceInstance(url:Maps.url.appendingPathComponent("Top Down Scroller.tmx"), project: SpriteKit()) 
        }
    }
}

extension ResourceContainer {
    var allResources : Set<URL> {
        var result = Set<URL>()
        
        result.insert(self.url)
        for resource in contents {
            if let resourceContainer = resource as? ResourceContainer {
                result.formUnion(resourceContainer.allResources)
            } else {
                result.insert(resource.url)
            }
        }
        
        return result
    }
}



#if canImport(TiledKit)
import TiledKit

public enum TiledResourcesError : Error {
    case resourceIsNotAProjectResource(URL)
}

public extension Resource {
    internal var asProjectResource : ProjectResource?  {
        return self as? ProjectResource
    }
    func loadTileSet<O:TileSet>() throws -> O {
        guard let projectResource = asProjectResource else {
            throw TiledResourcesError.resourceIsNotAProjectResource(url)
        }
        return try Project(at: projectResource.project.url).retrieve(asType: O.self, from: url)
    }

    func loadMap() throws -> Map {
        guard let projectResource = asProjectResource else {
            throw TiledResourcesError.resourceIsNotAProjectResource(url)
        }
        return try Project(at: projectResource.project.url).retrieve(asType: Map.self, from: url)
    }
    
    func loadMap<E:Engine>(for engine:E.Type) throws ->E.MapType {
        guard let projectResource = asProjectResource else {
            throw TiledResourcesError.resourceIsNotAProjectResource(url)
        }
        return try Project(at: projectResource.project.url).retrieve(asType: E.MapType.self, from: url)
    }
}

#endif
