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
// Extensions.swift
// 06/20/2016
// -----------------------------------------------------------------------------

#if os(OSX)

    import AppKit
    
    /// ...
    extension NSColor {

        ///
        public convenience init(_ color: GrayColor<Float>) {
            self.init(white:CGFloat(color.gray), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: GrayColor<Double>) {
            self.init(white:CGFloat(color.gray), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: GrayAlphaColor<Float>) {
            self.init(white:CGFloat(color.gray), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: GrayAlphaColor<Double>) {
            self.init(white:CGFloat(color.gray), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: HSVColor<Float>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:1.0)
        }

        ///
        public convenience init(_ color: HSVColor<Double>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:1.0)
        }

        ///
        public convenience init(_ color: HSVAColor<Float>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: HSVAColor<Double>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:CGFloat(color.alpha))
        }

        ///
        public convenience init(_ color: RGBColor<Float>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:1.0)
        }

        ///
        public convenience init(_ color: RGBColor<Double>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:1.0)
        }

        ///
        public convenience init(_ color: RGBAColor<Float>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: RGBAColor<Double>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:CGFloat(color.alpha))
        }
    }

#elseif os(iOS)

    import UIKit
    
    /// ...
    extension UIColor {
        
        ///
        public convenience init(_ color: GrayColor<Float>) {
            self.init(white:CGFloat(color.gray), alpha:1.0)
        }

        ///
        public convenience init(_ color: GrayColor<Double>) {
            self.init(white:CGFloat(color.gray), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: GrayAlphaColor<Float>) {
            self.init(white:CGFloat(color.gray), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: GrayAlphaColor<Double>) {
            self.init(white:CGFloat(color.gray), alpha:CGFloat(color.alpha))
        }

        ///
        public convenience init(_ color: HSVColor<Float>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: HSVColor<Double>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: HSVAColor<Float>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: HSVAColor<Double>) {
            self.init(hue:CGFloat(color.hue), saturation:CGFloat(color.saturation), brightness:CGFloat(color.value), alpha:CGFloat(color.alpha))
        }

        ///
        public convenience init(_ color: RGBColor<Float>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: RGBColor<Double>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:1.0)
        }
        
        ///
        public convenience init(_ color: RGBAColor<Float>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:CGFloat(color.alpha))
        }
        
        ///
        public convenience init(_ color: RGBAColor<Double>) {
            self.init(red:CGFloat(color.red), green:CGFloat(color.green), blue:CGFloat(color.blue), alpha:CGFloat(color.alpha))
        }
    }
    
#endif







