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
// Demo.playground
// 06/20/2016
// -----------------------------------------------------------------------------

import AlchemyColor

/// Load a pixel from a grayscale image
let pixel = GrayColor<UInt8>(0xF1)

/// Promote to allow floating point conversions
let gray = GrayColor<Double>(pixel)

/// Operate on the promoted values
var hsv = HSVColor(RGBColor(gray))

/// Do some conversion
hsv[0] *= 0.5
hsv[1] *= 2.0
hsv[2] *= 0.75

var newGray = GrayColor(RGBColor(hsv))

/// Store in a different optimized format
let newPixel = GrayAlphaColor<UInt16>(newGray, alpha:UInt16.max / 2)
