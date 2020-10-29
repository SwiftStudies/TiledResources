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
public protocol ResourceContainer {
    static var url : URL { get }
}

public protocol ProjectResource {
    static var project : ResourceContainer.Type { get }
}

public protocol Resource {
    var url : URL { get }
}

public protocol TileSetResource : Resource, ProjectResource {
}

public protocol MapResource : Resource, ProjectResource {
    
}

#if canImport(TiledKit)
import TiledKit

public extension TileSetResource {
    func load<O:TileSet>() throws -> O {
        return try Project(at: Self.project.url).retrieve(asType: O.self, from: url)
    }
}

public extension MapResource {
    func load() throws -> Map {
        return try Project(at: Self.project.url).retrieve(asType: Map.self, from: url)
    }
    
    func load<E:Engine>(for engine:E.Type) throws ->E.MapType {
        return try Project(at: Self.project.url).retrieve(asType: E.MapType.self, from: url)
    }
}
#endif

fileprivate struct ResourceInstance : Resource{
    var url : URL
}

public extension Resource where Self : RawRepresentable, Self.RawValue == String, Self : ResourceContainer {
    var url : URL {
        return Self.url.appendingPathComponent(rawValue)
    }
}

public struct TiledResources {
    public static let rootURL = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
    
    public struct SpriteKit : ResourceContainer {
        public static var url : URL {
            return TiledResources.rootURL.appendingPathComponent("SpriteKit")
        }        

        public static let projectFile : Resource = ResourceInstance(url: url.appendingPathComponent("SpriteKit.tiled-project"))
        public static let objectTypesFile : Resource = ResourceInstance(url: url.appendingPathComponent("Object Types.xml"))

        public enum Maps : String, CaseIterable, ResourceContainer, MapResource {
            public static var project: ResourceContainer.Type {
                return SpriteKit.self
            }
            public static var url : URL {
                return SpriteKit.url.appendingPathComponent("Maps")
            }
            case lightTest = "Light Test.tmx", readyPlayerOne = "Ready Player 1.tmx", topDownScroller = "Top Down Scroller.tmx"
        }
        
        public enum TileSets : String, CaseIterable, ResourceContainer, TileSetResource {
            public static var project: ResourceContainer.Type {
                return SpriteKit.self
            }
            
            public static var url : URL {
                return SpriteKit.url.appendingPathComponent("Tilesets")
            }
            case dungeon = "Dungeon.tsx"
        }        

    }
    
    public struct GenericTiledProject : ResourceContainer {
        public static var url : URL {
            return TiledResources.rootURL.appendingPathComponent("Generic Tiled Project")
        }
                
        public static let projectFile : Resource = ResourceInstance(url: url.appendingPathComponent("Generic Tiled Project.tiled-project"))
        public static let objectTypesFile : Resource = ResourceInstance(url: url.appendingPathComponent("Object Types.xml"))
        
        public enum Maps : String, CaseIterable, ResourceContainer, MapResource {
            public static var project: ResourceContainer.Type {
                return GenericTiledProject.self
            }
            public static var url : URL {
                return GenericTiledProject.url.appendingPathComponent("Maps")
            }
            case topDown2D = "2D Top Down.tmx", isometric = "Isometric.tmx", testMap1 = "Test Map 1.tmx", testMap2 = "Test Map 2.tmx"
            case oneOfEverything = "One of Everything.tmx"
            case base64 = "Base64.tmx",base64zlib="Base64zlib.tmx",base64zstandard="Base64zstandard.tmx"
        }
        
        public enum TileSets : String, CaseIterable, ResourceContainer, TileSetResource {
            public static var project: ResourceContainer.Type {
                return GenericTiledProject.self
            }
            
            public static var url : URL {
                return GenericTiledProject.url.appendingPathComponent("TileSets")
            }
            case animation = "Animation.tsx", isometric="Isometric.tsx"
            case topDownNoMarginNoSpacing = "Top Down [Sheet M-0 S-0].tsx", topDownMarginAndSpacing = "Top Down [Sheet M-4 S-4].tsx"
            case alphabet = "Alphabet.tsx", singleTile = "Single Tile.tsx"
        }
    }
}
