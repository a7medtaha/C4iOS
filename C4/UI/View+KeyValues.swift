// Copyright © 2014 C4
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions: The above copyright
// notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import UIKit

extension View {
    ///  Sets the arbitrary keyed-data for the specified key.
    ///
    /// - parameter value: The value for the key identified by _key_.
    /// - parameter key:   The name of one of the receiver's properties.
    public override func setValue(value: AnyObject?, forKey key: String) {
        switch key {
        case "frame":
            if let nsvalue = value as? NSValue {
                frame = Rect(nsvalue.CGRectValue())
            }

        case "bounds":
            if let nsvalue = value as? NSValue {
                bounds = Rect(nsvalue.CGRectValue())
            }

        case "center":
            if let nsvalue = value as? NSValue {
                center = Point(nsvalue.CGPointValue())
            }

        case "origin":
            if let nsvalue = value as? NSValue {
                origin = Point(nsvalue.CGPointValue())
            }

        case "size":
            if let nsvalue = value as? NSValue {
                size = Size(nsvalue.CGSizeValue())
            }

        case "backgroundColor":
            if let color = value as? UIColor {
                backgroundColor = Color(color)
            }

        default:
            super.setValue(value, forKey: key)
        }
    }

    ///  Returns the arbitrary keyed-data specified by the given key.
    ///
    /// - parameter key: The name of one of the receiver's properties.
    ///
    /// - returns: The value for the data specified by the key.
    public override func valueForKey(key: String) -> AnyObject? {
        switch key {
        case "frame":
            return NSValue(CGRect: CGRect(frame))

        case "bounds":
            return NSValue(CGRect: CGRect(bounds))

        case "center":
            return NSValue(CGPoint: CGPoint(center))

        case "origin":
            return NSValue(CGPoint: CGPoint(origin))

        case "size":
            return NSValue(CGSize: CGSize(size))

        case "backgroundColor":
            if let color = backgroundColor {
                return UIColor(color)
            } else {
                return nil
            }

        default:
            return super.valueForKey(key)
        }
    }
}
