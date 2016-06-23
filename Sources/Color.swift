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
// Color.swift
// 06/20/2016
// -----------------------------------------------------------------------------

import Foundation

/// ...
private func _convert<T: FloatingPoint>(red: T, green: T, blue: T) -> (hue: T, saturation: T, value: T) {
    let r = red
    let g = green
    let b = blue
    let min = Swift.min(r, g, b)
    let max = Swift.max(r, g, b)
    let v: T = max
    let delta = max - min
    let s: T
    if max == T(0) {
        s = T(0)
        let h = T(0)
        return (h, s, v)
    } else {
        s = delta / max
        var h: T
        if delta == T(0) {
            h = T(0)
        } else if r == max {
            h = (g - b) / delta
        } else if g == max {
            h = T(2) + (b - r) / delta
        } else {
            h = T(4) + (r - g) / delta
        }
        h *= T(60)
        if h < 0 {
            h += T(360)
        }
        /// Normalize hue into [0.0, 1.0]
        h /= T(360)
        return (h, s, v)
    }
}

/// ...
private func _convert<T: FloatingPoint>(hue: T, saturation: T, value: T, floor: @noescape (T) -> T) -> (red: T, green: T, blue: T) {
    var h = hue
    let s = saturation
    let v = value
    if s == T(0) {
        return (v, v, v)
    } else {
        /// Convert hue from [0.0, 1.0] to [0.0, 360.0] for calculation
        h *= T(360)
        h /= T(60)
        let i = floor(h)
        let f = h - i
        let p = v * (1 - s)
        let q = v * (1 - s * f)
        let t = v * (1 - s * (1 - f))
        switch i {
        case 0:
            return (v, t, p)
        case 1:
            return (q, v, p)
        case 2:
            return (p, v, t)
        case 3:
            return (p, q, v)
        case 4:
            return (t, p, v)
        default:
            return (v, p, q)
        }
    }
}

/// ...
private func _saturate<T: FloatingPoint>(_ value: T) -> T {
    return Swift.max(Swift.min(value, 1), 0)
}

/// ...
public protocol EncodableStorage {
    
    /// ...
    static func decode<T: FloatingPointStorage>(encodedStorage value: Self) -> T
    
    /// ...
    static func encode<T: FloatingPointStorage>(floatingStorage value: T) -> Self
}


/// ...
extension UInt8: EncodableStorage {
    
    /// ...
    public static func decode<T: FloatingPointStorage>(encodedStorage value: UInt8) -> T {
        return T(value) / T(UInt8.max)
    }
    
    /// ...
    public static func encode<T: FloatingPointStorage>(floatingStorage value: T) -> UInt8 {
        switch sizeof(T) {
        case sizeof(Float):
            return UInt8(unsafeBitCast(_saturate(value), to:Float.self) * Float(UInt8.max))
        case sizeof(Double):
            return UInt8(unsafeBitCast(_saturate(value), to:Double.self) * Double(UInt8.max))
        default:
            fatalError("encode(channel:\(T.self)) expects CGFloat, Float, or Double and received \(T.self)")
        }
    }
}

/// ...
extension UInt16: EncodableStorage {

    /// ...
    public static func decode<T: FloatingPointStorage>(encodedStorage value: UInt16) -> T {
        return T(value) / T(UInt16.max)
    }
    
    /// ...
    public static func encode<T: FloatingPointStorage>(floatingStorage value: T) -> UInt16 {
        switch sizeof(T) {
        case sizeof(Float):
            return UInt16(unsafeBitCast(_saturate(value), to:Float.self) * Float(UInt16.max))
        case sizeof(Double):
            return UInt16(unsafeBitCast(_saturate(value), to:Double.self) * Double(UInt16.max))
        default:
            fatalError("encode(channel:\(T.self)) expects CGFloat, Float, or Double and received \(T.self)")
        }
    }
}

/// ...
extension UInt32: EncodableStorage {
    
    /// ...
    public static func decode<T: FloatingPointStorage>(encodedStorage value: UInt32) -> T {
        return T(value) / T(UInt32.max)
    }
    
    /// ...
    public static func encode<T: FloatingPointStorage>(floatingStorage value: T) -> UInt32 {
        switch sizeof(T) {
        case sizeof(Float):
            return UInt32(unsafeBitCast(_saturate(value), to:Float.self) * Float(UInt32.max))
        case sizeof(Double):
            return UInt32(unsafeBitCast(_saturate(value), to:Double.self) * Double(UInt32.max))
        default:
            fatalError("encode(channel:\(T.self)) expects CGFloat, Float, or Double and received \(T.self)")
        }
    }
}

/// ...
public protocol FloatingPointStorage: FloatingPoint {
    
    /// ...
    static func convert(red: Self, green: Self, blue: Self) -> (hue: Self, saturation: Self, value: Self)
    
    /// ...
    static func convert(hue: Self, saturation: Self, value: Self) -> (red: Self, green: Self, blue: Self)

    /// ...
    static func luminance(red: Self, green: Self, blue: Self) -> Self
}

/// ...
extension Float: FloatingPointStorage {
    
    /// ...
    public static func convert(red: Float, green: Float, blue: Float) -> (hue: Float, saturation: Float, value: Float) {
        return _convert(red:red, green:green, blue:blue)
    }
    
    /// ...
    public static func convert(hue: Float, saturation: Float, value: Float) -> (red: Float, green: Float, blue: Float) {
        return _convert(hue:hue, saturation:saturation, value:value, floor:Darwin.floor)
    }

    /// ...
    public static func luminance(red: Float, green: Float, blue: Float) -> Float {
        return 0.2126 * red + 0.7152 * green + 0.0722 * blue
    }
}

/// ...
extension Double: FloatingPointStorage {

    /// ...
    public static func convert(red: Double, green: Double, blue: Double) -> (hue: Double, saturation: Double, value: Double) {
        return _convert(red:red, green:green, blue:blue)
    }
    
    /// ...
    public static func convert(hue: Double, saturation: Double, value: Double) -> (red: Double, green: Double, blue: Double) {
        return _convert(hue:hue, saturation:saturation, value:value, floor:Darwin.floor)
    }

    /// ...
    public static func luminance(red: Double, green: Double, blue: Double) -> Double {
        return 0.2126 * red + 0.7152 * green + 0.0722 * blue
    }
}

/// ...
public protocol Color {
    
    /// ...
    associatedtype ChannelStorage
    
    /// ...
    subscript (channel: Int) -> ChannelStorage { get mutating set }
    
    /// ...
    var channelCount: Int { get }
    
    /// ...
    var hasAlpha: Bool { get }
    
    /// ...
    var isOpaque: Bool { get }
}

/// ...
extension Color {
    
    /// ...
    var isTransparent: Bool {
        return !isOpaque
    }
}

/// ...
public struct GrayColor<Storage>: Color {
    
    /// ...
    public typealias ChannelStorage = Storage
    
    /// ...
    public init(_ gray: Storage) {
        self.gray = gray
    }

    /// ...
    public subscript (channel: Int) -> Storage {
        get {
            switch channel {
            case 0:
                return gray
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                return gray
            }
        }
        mutating set {
            switch channel {
            case 0:
                gray = newValue
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                break
            }
        }
    }
    
    /// ...
    public var channelCount: Int {
        return 1
    }
    
    /// ...
    public var hasAlpha: Bool {
        return false
    }
    
    /// ...
    public var isOpaque: Bool {
        return true
    }
    
    public var gray: Storage
}

/// ...
extension GrayColor: CustomStringConvertible {
    
    public var description: String {
        return "GrayColor<\(Storage.self)>(\(gray))"
    }
}

/// ...
extension GrayColor where Storage: FloatingPointStorage {
    
    /// ...
    public init(_ color: RGBColor<Storage>) {
        self.init(Storage.luminance(red:color.red, green:color.green, blue:color.blue))
    }
    
    /// ...
    public init<OtherStorage: EncodableStorage>(_ color: GrayColor<OtherStorage>) {
        self.init(OtherStorage.decode(encodedStorage:color.gray))
    }
}

/// ...
extension GrayColor where Storage: EncodableStorage {

    /// ...
    public init<OtherStorage: FloatingPointStorage>(_ color: GrayColor<OtherStorage>) {
        self.init(Storage.encode(floatingStorage:color.gray))
    }
}

/// ...
public struct HSVColor<Storage>: Color {

    /// ...
    public typealias ChannelStorage = Storage

    /// ...
    public init(_ hue: Storage, _ saturation: Storage, _ value: Storage) {
        self.hue = hue
        self.saturation = saturation
        self.value = value
    }

    /// ...
    public subscript (channel: Int) -> Storage {
        get {
            switch channel {
            case 0:
                return hue
            case 1:
                return saturation
            case 2:
                return value
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                return hue
            }
        }
        mutating set {
            switch channel {
            case 0:
                hue = newValue
            case 1:
                saturation = newValue
            case 2:
                value = newValue
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                break
            }
        }
    }

    /// ...
    public var channelCount: Int {
        return 3
    }

    /// ...
    public var hasAlpha: Bool {
        return false
    }

    /// ...
    public var isOpaque: Bool {
        return true
    }

    /// ...
    public var hue: Storage

    /// ...
    public var saturation: Storage

    /// ...
    public var value: Storage
}

/// ...
extension HSVColor: CustomStringConvertible {

    public var description: String {
        return "HSVColor<\(Storage.self)>(\(hue), \(saturation), \(value))"
    }
}

/// ...
extension HSVColor where Storage: FloatingPointStorage {
    
    /// ...
    public init(_ color: RGBColor<Storage>) {
        let (hue, saturation, value) = Storage.convert(red:color.red, green:color.green, blue:color.blue)
        self.init(hue, saturation, value)
    }

    /// ...
    public init<OtherStorage: EncodableStorage>(_ color: HSVColor<OtherStorage>) {
        let hue: Storage = OtherStorage.decode(encodedStorage:color.hue)
        let saturation: Storage = OtherStorage.decode(encodedStorage:color.saturation)
        let value: Storage = OtherStorage.decode(encodedStorage:color.value)
        self.init(hue, saturation, value)
    }
}

/// ...
extension HSVColor where Storage: EncodableStorage {
    
    /// ...
    public init<OtherStorage: FloatingPointStorage>(_ color: HSVColor<OtherStorage>) {
        let hue = Storage.encode(floatingStorage:color.hue)
        let saturation = Storage.encode(floatingStorage:color.saturation)
        let value = Storage.encode(floatingStorage:color.value)
        self.init(hue, saturation, value)
    }
}

/// ...
public struct RGBColor<Storage>: Color {
    
    /// ...
    public typealias ChannelStorage = Storage
    
    /// ...
    public init(_ red: Storage, _ green: Storage, _ blue: Storage) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    /// ...
    public init(_ color: GrayColor<Storage>) {
        self.init(color.gray, color.gray, color.gray)
    }

    /// ...
    public subscript (channel: Int) -> Storage {
        get {
            switch channel {
            case 0:
                return red
            case 1:
                return green
            case 2:
                return blue
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                return red
            }
        }
        mutating set {
            switch channel {
            case 0:
                red = newValue
            case 1:
                green = newValue
            case 2:
                blue = newValue
            default:
                assertionFailure("channel (\(channel)) must be strictly in 0..<\(channelCount)")
                break
            }
        }
    }
    
    /// ...
    public var channelCount: Int {
        return 3
    }
    
    /// ...
    public var hasAlpha: Bool {
        return false
    }
    
    /// ...
    public var isOpaque: Bool {
        return true
    }
    
    /// ...
    public var red: Storage
    
    /// ...
    public var green: Storage
    
    /// ...
    public var blue: Storage
}

/// ...
extension RGBColor: CustomStringConvertible {
    
    public var description: String {
        return "RGBColor<\(Storage.self)>(\(red), \(green), \(blue))"
    }
}

/// ...
extension RGBColor where Storage: FloatingPointStorage {

    /// ...
    public init(_ color: HSVColor<Storage>) {
        let (red, green, blue) = Storage.convert(hue:color.hue, saturation:color.saturation, value:color.value)
        self.init(red, green, blue)
    }

    /// ...
    public init<OtherStorage: EncodableStorage>(_ color: RGBColor<OtherStorage>) {
        let red: Storage = OtherStorage.decode(encodedStorage:color.red)
        let green: Storage = OtherStorage.decode(encodedStorage:color.green)
        let blue: Storage = OtherStorage.decode(encodedStorage:color.blue)
        self.init(red, green, blue)
    }
}

/// ...
extension RGBColor where Storage: EncodableStorage {
    
    /// ...
    public init<OtherStorage: FloatingPointStorage>(_ color: RGBColor<OtherStorage>) {
        let red = Storage.encode(floatingStorage:color.red)
        let green = Storage.encode(floatingStorage:color.green)
        let blue = Storage.encode(floatingStorage:color.blue)
        self.init(red, green, blue)
    }
}
