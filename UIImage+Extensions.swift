//
//  UIImage+Extensions.swift
//  coreMLimageClassifcation
//
//  Created by Daval Cato on 8/13/21.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeTo(size :CGSize) -> UIImage {
        
        UIGraphicsBeginImageContext(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
        
    }
    
    func toBuffer() -> CVPixelBuffer? {
        
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelbuff
        
        
    }
    
    
    
}













