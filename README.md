<center> 
    <h1>AlchemyColor</h1> 
</center>

<p align="center">
    <img src="https://img.shields.io/badge/platform-osx-lightgrey.svg" alt="Platform">
    <img src="https://img.shields.io/badge/language-swift-orange.svg" alt="Language">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License">
</p>

<p align="center">
    <a href="#requirements">Requirements</a>
    <a href="#installation">Installation</a>
    <a href="#usage">Usage</a>
    <a href="#references">References</a>
    <a href="#license">License</a>
    <a href="#todo">TODO</a>
</p>

AlchemyColor is a Swift package for colors and colorspaces

## Requirements

- Xcode
    - Version: **8.0 beta (8S128d)**
    - Language: **Swift 3.0**
- OS X
    - Latest SDK: **macOS 10.12**
    - Deployment Target: **OS X 10.10**

While AlchemyColor has only been tested on OS X with a beta version of Xcode, 
it should presumably work on iOS, tvOS, and watchOS as well.  It only depends on the 
the Swift standard library with optional added extensions to AppKit, UIKit, 
CoreGraphics, and simd. 

## Installation

Install using the [Swift Package Manager](https://swift.org/package-manager/)

Add the project as a dependency to your Package.swift:

```swift
import PackageDescription

let package = Package(
    name: "MyProjectUsingAlchemyColor",
    dependencies: [
        .Package(url: "https://github.com/chris-al-brown/alchemy-color", majorVersion: 0, minor: 1)
    ]
)
```

Then import `import AlchemyColor`.

## Usage

Check out 'Demo.playground' for example usage.

## References

1. [Color Conversion Algorithms](https://www.cs.rit.edu/~ncs/color/t_convert.html)

2. [SwiftHEXColors](https://github.com/thii/SwiftHEXColors)

## License

AlchemyColor is released under the [MIT License](LICENSE.md).

## TODO

- [x] Add NSColor, UIColor conversion methods
- [x] Add GrayAlphaColor
- [ ] Add RGBAColor
- [x] Add HSVAColor
- [ ] Add String/Int hex init methods
