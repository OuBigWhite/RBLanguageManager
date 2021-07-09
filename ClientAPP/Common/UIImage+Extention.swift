//
//  UIImage+Extention.swift
//  ReviewAPP
//
//  Created by 冉彬 on 2020/3/18.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import Foundation
import UIKit



extension UIImage {
    //颜色生成图片
    class func createImage(color: UIColor, width: CGFloat, height: CGFloat)-> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage{

           let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)

           UIGraphicsBeginImageContext(rect.size)

           let context: CGContext = UIGraphicsGetCurrentContext()!

           context.setFillColor(color.cgColor)

           context.fill(rect)

           

           let image = UIGraphicsGetImageFromCurrentImageContext()

           UIGraphicsGetCurrentContext()

           return image!

       }
    
    //二分压缩法
     func compressImageMid(maxLength: Int) -> UIImage? {
        var compression: CGFloat = 1
        guard var data = self.jpegData(compressionQuality: 1) else { return nil }
            print("压缩前kb: \( Double((data.count)/1024))")
            if data.count < maxLength {
                return self
            }
            print("压缩前kb", data.count / 1024, "KB")
            var max: CGFloat = 1
            var min: CGFloat = 0
            for _ in 0..<6 {
                compression = (max + min) / 2
                data = self.jpegData(compressionQuality: compression)!
                if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
                    min = compression
                } else if data.count > maxLength {
                    max = compression
                } else {
                    break
                }
            }
        print("压缩后kb", data.count / 1024, "KB")
        let resultImage: UIImage = UIImage(data: data)!
        return resultImage
     }
}

