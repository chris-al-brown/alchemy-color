// -----------------------------------------------------------------------------
// Copyright (c) 2015 - 2016, Christopher A. Brown (chris-al-brown)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// AlchemyColor
// AlchemyColorTests.swift
// 06/17/2016
// -----------------------------------------------------------------------------

import XCTest
@testable import AlchemyColor

/// Hides the RGBColor definition from Quicktime
public typealias RGBColor = AlchemyColor.RGBColor

/// Returns a uniform value in [0.0, 1.0] bitcasting from an input in {0, 1, ..., UINT32_MAX}
public func uniformCast(_ input: UInt32) -> Float {
    let kExponentBits = UInt32(0x3F800000)
    let kMantissaMask = UInt32(0x007FFFFF)
    let u = (input & kMantissaMask) | kExponentBits
    return unsafeBitCast(u, to:Float.self) - 1.0
}

/// Returns a uniform Float in [0.0, 1.0] using arc4random
public func uniform() -> Float {
    return uniformCast(arc4random_uniform(UINT32_MAX))
}

/// Returns a uniform GrayColor<UInt8>
public func random() -> GrayColor<UInt8> {
    return GrayColor(UInt8.encode(floatingStorage:uniform()))
}

/// Returns a uniform GrayColor<UInt16>
public func random() -> GrayColor<UInt16> {
    return GrayColor(UInt16.encode(floatingStorage:uniform()))
}

/// Returns a uniform GrayColor<Float>
public func random() -> GrayColor<Float> {
    return GrayColor(uniform())
}

/// Returns a uniform GrayColor<Double>
public func random() -> GrayColor<Double> {
    return GrayColor(Double(uniform()))
}

/// Returns a uniform GrayAlphaColor<UInt8>
public func random() -> GrayAlphaColor<UInt8> {
    return GrayAlphaColor(UInt8.encode(floatingStorage:uniform()), UInt8.encode(floatingStorage:uniform()))
}

/// Returns a uniform GrayColor<UInt16>
public func random() -> GrayAlphaColor<UInt16> {
    return GrayAlphaColor(UInt16.encode(floatingStorage:uniform()), UInt16.encode(floatingStorage:uniform()))
}

/// Returns a uniform GrayColor<Float>
public func random() -> GrayAlphaColor<Float> {
    return GrayAlphaColor(uniform(), uniform())
}

/// Returns a uniform GrayColor<Double>
public func random() -> GrayAlphaColor<Double> {
    return GrayAlphaColor(Double(uniform()), Double(uniform()))
}

/// Returns a uniform HSVColor<UInt8>
public func random() -> HSVColor<UInt8> {
    let h = UInt8.encode(floatingStorage:uniform())
    let s = UInt8.encode(floatingStorage:uniform())
    let v = UInt8.encode(floatingStorage:uniform())
    return HSVColor(h, s, v)
}

/// Returns a uniform HSVColor<UInt16>
public func random() -> HSVColor<UInt16> {
    let h = UInt16.encode(floatingStorage:uniform())
    let s = UInt16.encode(floatingStorage:uniform())
    let v = UInt16.encode(floatingStorage:uniform())
    return HSVColor(h, s, v)
}

/// Returns a uniform HSVColor<Float>
public func random() -> HSVColor<Float> {
    return HSVColor(uniform(), uniform(), uniform())
}

/// Returns a uniform HSVColor<Double>
public func random() -> HSVColor<Double> {
    let h = Double(uniform())
    let s = Double(uniform())
    let v = Double(uniform())
    return HSVColor(h, s, v)
}

/// Returns a uniform HSVAColor<UInt8>
public func random() -> HSVAColor<UInt8> {
    let h = UInt8.encode(floatingStorage:uniform())
    let s = UInt8.encode(floatingStorage:uniform())
    let v = UInt8.encode(floatingStorage:uniform())
    let a = UInt8.encode(floatingStorage:uniform())
    return HSVAColor(h, s, v, a)
}

/// Returns a uniform HSVAColor<UInt16>
public func random() -> HSVAColor<UInt16> {
    let h = UInt16.encode(floatingStorage:uniform())
    let s = UInt16.encode(floatingStorage:uniform())
    let v = UInt16.encode(floatingStorage:uniform())
    let a = UInt16.encode(floatingStorage:uniform())
    return HSVAColor(h, s, v, a)
}

/// Returns a uniform HSVAColor<Float>
public func random() -> HSVAColor<Float> {
    return HSVAColor(uniform(), uniform(), uniform(), uniform())
}

/// Returns a uniform HSVAColor<Double>
public func random() -> HSVAColor<Double> {
    let h = Double(uniform())
    let s = Double(uniform())
    let v = Double(uniform())
    let a = Double(uniform())
    return HSVAColor(h, s, v, a)
}

/// Returns a uniform RGBColor<UInt8>
public func random() -> RGBColor<UInt8> {
    let r = UInt8.encode(floatingStorage:uniform())
    let g = UInt8.encode(floatingStorage:uniform())
    let b = UInt8.encode(floatingStorage:uniform())
    return RGBColor(r, g, b)
}

/// Returns a uniform RGBColor<UInt16>
public func random() -> RGBColor<UInt16> {
    let r = UInt16.encode(floatingStorage:uniform())
    let g = UInt16.encode(floatingStorage:uniform())
    let b = UInt16.encode(floatingStorage:uniform())
    return RGBColor(r, g, b)
}

/// Returns a uniform RGBColor<Float>
public func random() -> RGBColor<Float> {
    return RGBColor(uniform(), uniform(), uniform())
}

/// Returns a uniform RGBColor<Double>
public func random() -> RGBColor<Double> {
    let r = Double(uniform())
    let g = Double(uniform())
    let b = Double(uniform())
    return RGBColor(r, g, b)
}

/// Returns a uniform RGBAColor<UInt8>
public func random() -> RGBAColor<UInt8> {
    let r = UInt8.encode(floatingStorage:uniform())
    let g = UInt8.encode(floatingStorage:uniform())
    let b = UInt8.encode(floatingStorage:uniform())
    let a = UInt8.encode(floatingStorage:uniform())
    return RGBAColor(r, g, b, a)
}

/// Returns a uniform RGBAColor<UInt16>
public func random() -> RGBAColor<UInt16> {
    let r = UInt16.encode(floatingStorage:uniform())
    let g = UInt16.encode(floatingStorage:uniform())
    let b = UInt16.encode(floatingStorage:uniform())
    let a = UInt16.encode(floatingStorage:uniform())
    return RGBAColor(r, g, b, a)
}

/// Returns a uniform RGBAColor<Float>
public func random() -> RGBAColor<Float> {
    return RGBAColor(uniform(), uniform(), uniform(), uniform())
}

/// Returns a uniform RGBAColor<Double>
public func random() -> RGBAColor<Double> {
    let r = Double(uniform())
    let g = Double(uniform())
    let b = Double(uniform())
    let a = Double(uniform())
    return RGBAColor(r, g, b, a)
}

/// ...
let sampleCount = 10_000

/// ...
class AlchemyColorTests: XCTestCase {

    /// ...
    func assayBounds<T: Color where T.ChannelStorage: Comparable>(of color: T, min: T.ChannelStorage, max: T.ChannelStorage) {
        for i in 0..<color.channelCount {
            XCTAssert(min <= color[i] && color[i] <= max, "\(color)[\(i)] = \(color[i]) is outside of bounds [\(min), \(max)]")
        }
    }
    
    /// ...
    func testGrayColor() {
        XCTAssert(GrayColor<Float>(0.1) == GrayColor<Float>(0.1), "GrayColor failed equality")
        XCTAssert(GrayColor<UInt8>(0x1) == GrayColor<UInt8>(0x1), "GrayColor failed equality")
        let gray = random() as GrayColor<Float>
        XCTAssert(!gray.hasAlpha, "\(gray) should not have an alpha channel")
        XCTAssert(gray.channelCount == 1, "\(gray) should have 1 channel")
        for _ in 0..<sampleCount {
            let gray1 = GrayColor<UInt8>(random() as GrayColor<Float>)
            assayBounds(of:gray1, min:UInt8.min, max:UInt8.max)
            let gray2 = GrayColor<Double>(random() as GrayColor<UInt16>)
            assayBounds(of:gray2, min:0.0, max:1.0)
            
            let gray3 = GrayColor<Float>(random() as RGBColor<Float>)
            assayBounds(of:gray3, min:0.0, max:1.0)
            let gray4 = GrayColor<Double>(random() as RGBColor<Double>)
            assayBounds(of:gray4, min:0.0, max:1.0)
            
            let gray5 = GrayColor<UInt8>(random() as GrayAlphaColor<Float>)
            assayBounds(of:gray5, min:UInt8.min, max:UInt8.max)
            let gray6 = GrayColor<Double>(random() as GrayAlphaColor<UInt16>)
            assayBounds(of:gray6, min:0.0, max:1.0)
        }
    }

    /// ...
    func testGrayAlphaColor() {
        XCTAssert(GrayAlphaColor<Float>(0.1, 0.2) == GrayAlphaColor<Float>(0.1, 0.2), "GrayAlphaColor failed equality")
        XCTAssert(GrayAlphaColor<UInt8>(0x1, 0x2) == GrayAlphaColor<UInt8>(0x1, 0x2), "GrayAlphaColor failed equality")
        let gray = random() as GrayAlphaColor<Float>
        XCTAssert(gray.hasAlpha, "\(gray) should have an alpha channel")
        XCTAssert(gray.channelCount == 2, "\(gray) should have 2 channels")
        for _ in 0..<sampleCount {
            let gray1 = GrayAlphaColor<UInt8>(random() as GrayAlphaColor<Float>)
            assayBounds(of:gray1, min:UInt8.min, max:UInt8.max)
            let gray2 = GrayAlphaColor<Double>(random() as GrayAlphaColor<UInt16>)
            assayBounds(of:gray2, min:0.0, max:1.0)
            
            let gray3 = GrayAlphaColor<Float>(random() as RGBColor<Float>)
            assayBounds(of:gray3, min:0.0, max:1.0)
            let gray4 = GrayAlphaColor<Double>(random() as RGBColor<Double>)
            assayBounds(of:gray4, min:0.0, max:1.0)
            
            let gray5 = GrayAlphaColor<UInt8>(random() as GrayColor<Float>)
            assayBounds(of:gray5, min:UInt8.min, max:UInt8.max)
            let gray6 = GrayAlphaColor<Double>(random() as GrayColor<UInt16>)
            assayBounds(of:gray6, min:0.0, max:1.0)
        }
    }

    /// ...
    func testRGBColor() {
        XCTAssert(RGBColor<Float>(0.1, 0.2, 0.3) == RGBColor<Float>(0.1, 0.2, 0.3), "RGBColor failed equality")
        XCTAssert(RGBColor<UInt8>(0x1, 0x2, 0x3) == RGBColor<UInt8>(0x1, 0x2, 0x3), "RGBColor failed equality")
        let rgb = random() as RGBColor<Float>
        XCTAssert(!rgb.hasAlpha, "\(rgb) should not have an alpha channel")
        XCTAssert(rgb.channelCount == 3, "\(rgb) should have 3 channels")
        for _ in 0..<sampleCount {
            let rgb1 = RGBColor<UInt8>(random() as RGBColor<Float>)
            assayBounds(of:rgb1, min:UInt8.min, max:UInt8.max)
            let rgb2 = RGBColor<Double>(random() as RGBColor<UInt16>)
            assayBounds(of:rgb2, min:0.0, max:1.0)
            
            let rgb3 = RGBColor<UInt8>(random() as GrayColor<UInt8>)
            assayBounds(of:rgb3, min:UInt8.min, max:UInt8.max)
            let rgb4 = RGBColor<UInt16>(random() as GrayColor<UInt16>)
            assayBounds(of:rgb4, min:UInt16.min, max:UInt16.max)
            let rgb5 = RGBColor<Float>(random() as GrayColor<Float>)
            assayBounds(of:rgb5, min:0.0, max:1.0)
            let rgb6 = RGBColor<Double>(random() as GrayColor<Double>)
            assayBounds(of:rgb6, min:0.0, max:1.0)

            let rgb7 = RGBColor<Float>(random() as HSVColor<Float>)
            assayBounds(of:rgb7, min:0.0, max:1.0)
            let rgb8 = RGBColor<Double>(random() as HSVColor<Double>)
            assayBounds(of:rgb8, min:0.0, max:1.0)

            let rgb9 = RGBColor<Float>(random() as RGBAColor<Float>)
            assayBounds(of:rgb9, min:0.0, max:1.0)
            let rgb0 = RGBColor<Double>(random() as RGBAColor<Double>)
            assayBounds(of:rgb0, min:0.0, max:1.0)
        }
    }
    
    /// ...
    func testRGBAColor() {
        XCTAssert(RGBAColor<Float>(0.1, 0.2, 0.3, 0.4) == RGBAColor<Float>(0.1, 0.2, 0.3, 0.4), "RGBAColor failed equality")
        XCTAssert(RGBAColor<UInt8>(0x1, 0x2, 0x3, 0x4) == RGBAColor<UInt8>(0x1, 0x2, 0x3, 0x4), "RGBAColor failed equality")
        let rgba = random() as RGBAColor<Float>
        XCTAssert(rgba.hasAlpha, "\(rgba) should have an alpha channel")
        XCTAssert(rgba.channelCount == 4, "\(rgba) should have 4 channels")
        for _ in 0..<sampleCount {
            let rgb1 = RGBAColor<UInt8>(random() as RGBColor<Float>)
            assayBounds(of:rgb1, min:UInt8.min, max:UInt8.max)
            let rgb2 = RGBAColor<Double>(random() as RGBColor<UInt16>)
            assayBounds(of:rgb2, min:0.0, max:1.0)
            
            let rgb3 = RGBAColor<UInt8>(random() as GrayColor<UInt8>)
            assayBounds(of:rgb3, min:UInt8.min, max:UInt8.max)
            let rgb4 = RGBAColor<UInt16>(random() as GrayColor<UInt16>)
            assayBounds(of:rgb4, min:UInt16.min, max:UInt16.max)
            let rgb5 = RGBAColor<Float>(random() as GrayColor<Float>)
            assayBounds(of:rgb5, min:0.0, max:1.0)
            let rgb6 = RGBAColor<Double>(random() as GrayColor<Double>)
            assayBounds(of:rgb6, min:0.0, max:1.0)
            
            let rgb7 = RGBAColor<Float>(random() as HSVColor<Float>)
            assayBounds(of:rgb7, min:0.0, max:1.0)
            let rgb8 = RGBAColor<Double>(random() as HSVColor<Double>)
            assayBounds(of:rgb8, min:0.0, max:1.0)
            
            let rgb9 = RGBAColor<Float>(random() as RGBColor<Float>)
            assayBounds(of:rgb9, min:0.0, max:1.0)
            let rgb0 = RGBAColor<Double>(random() as RGBColor<Double>)
            assayBounds(of:rgb0, min:0.0, max:1.0)
        }
    }
    
    /// ...
    func testHSVColor() {
        XCTAssert(HSVColor<Float>(0.1, 0.2, 0.3) == HSVColor<Float>(0.1, 0.2, 0.3), "HSVColor failed equality")
        XCTAssert(HSVColor<UInt8>(0x1, 0x2, 0x3) == HSVColor<UInt8>(0x1, 0x2, 0x3), "HSVColor failed equality")
        let hsv = random() as HSVColor<Float>
        XCTAssert(!hsv.hasAlpha, "\(hsv) should not have an alpha channel")
        XCTAssert(hsv.channelCount == 3, "\(hsv) should have 3 channels")
        for _ in 0..<sampleCount {
            let hsv1 = HSVColor<UInt8>(random() as HSVColor<Float>)
            assayBounds(of:hsv1, min:UInt8.min, max:UInt8.max)
            let hsv2 = HSVColor<Double>(random() as HSVColor<UInt16>)
            assayBounds(of:hsv2, min:0.0, max:1.0)
            
            let hsv3 = HSVColor<Float>(random() as RGBColor<Float>)
            assayBounds(of:hsv3, min:0.0, max:1.0)
            let hsv4 = HSVColor<Double>(random() as RGBColor<Double>)
            assayBounds(of:hsv4, min:0.0, max:1.0)

            let hsv5 = HSVColor<UInt8>(random() as HSVAColor<Float>)
            assayBounds(of:hsv5, min:UInt8.min, max:UInt8.max)
            let hsv6 = HSVColor<Double>(random() as HSVAColor<UInt16>)
            assayBounds(of:hsv6, min:0.0, max:1.0)
        }
    }

    /// ...
    func testHSVAColor() {
        XCTAssert(HSVAColor<Float>(0.1, 0.2, 0.3, 0.4) == HSVAColor<Float>(0.1, 0.2, 0.3, 0.4), "HSVAColor failed equality")
        XCTAssert(HSVAColor<UInt8>(0x1, 0x2, 0x3, 0x4) == HSVAColor<UInt8>(0x1, 0x2, 0x3, 0x4), "HSVAColor failed equality")
        let hsva = random() as HSVAColor<Float>
        XCTAssert(hsva.hasAlpha, "\(hsva) should have an alpha channel")
        XCTAssert(hsva.channelCount == 4, "\(hsva) should have 4 channels")
        for _ in 0..<sampleCount {
            let hsva1 = HSVAColor<UInt8>(random() as HSVColor<Float>)
            assayBounds(of:hsva1, min:UInt8.min, max:UInt8.max)
            let hsva2 = HSVAColor<Double>(random() as HSVColor<UInt16>)
            assayBounds(of:hsva2, min:0.0, max:1.0)
            
            let hsva3 = HSVAColor<Float>(random() as RGBColor<Float>)
            assayBounds(of:hsva3, min:0.0, max:1.0)
            let hsva4 = HSVAColor<Double>(random() as RGBColor<Double>)
            assayBounds(of:hsva4, min:0.0, max:1.0)
            
            let hsva5 = HSVAColor<UInt8>(random() as HSVAColor<Float>)
            assayBounds(of:hsva5, min:UInt8.min, max:UInt8.max)
            let hsva6 = HSVAColor<Double>(random() as HSVAColor<UInt16>)
            assayBounds(of:hsva6, min:0.0, max:1.0)

            let hsva7 = HSVAColor<UInt8>(random() as HSVColor<UInt8>)
            assayBounds(of:hsva7, min:UInt8.min, max:UInt8.max)
            let hsva8 = HSVAColor<Double>(random() as HSVColor<Double>)
            assayBounds(of:hsva8, min:0.0, max:1.0)
        }
    }

    /// ...
    static var allTests : [(String, (AlchemyColorTests) -> () throws -> Void)] {
        return [
            ("testGrayColor", testGrayColor),
            ("testGrayAlphaColor", testGrayAlphaColor),
            ("testHSVColor", testHSVColor),
            ("testHSVAColor", testHSVAColor),
            ("testRGBColor", testRGBColor),
            ("testRGBAColor", testRGBAColor)
        ]
    }
}

















