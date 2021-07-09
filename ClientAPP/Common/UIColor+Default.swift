//
//  UIColor+Default.swift
//  VerifyAPP
//
//  Created by 冉彬 on 2020/2/6.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    static var defaultTextColor: UIColor {
        return bgColorHEX(0x333333)
    }
    static var defaultBackgroundColor: UIColor {
        return bgColorHEX(0xEEEEEE)
    }
    static var defaultTheme: UIColor {
        return bgColorHEX(0xF05E58)
    }
    
    static var lowGreen:UIColor{
        return bgColorHEX(0x9DD8DB);
    }
    
    static var borderColor:UIColor {
        return bgColorHEX(0xE6E6E6);
    }
    
    static var color_999999:UIColor {
        return bgColorHEX(0x999999)
    }
    
    static var color_666666:UIColor {
        return bgColorHEX(0x666666)
    }
    
    static var color_F2F2F2:UIColor {
        return bgColorHEX(0xF2F2F2)
    }
    
    static var color_F3F3F3:UIColor {
        return bgColorHEX(0xF3F3F3)
    }
    
    static var color_9A9A9A:UIColor {
        return bgColorHEX(0x9A9A9A)
    }
    
    static var color_F5F5F5:UIColor {
        return bgColorHEX(0xF5F5F5)
    }
    
    static var color_EBEBEB: UIColor {
        return bgColorHEX(0xEBEBEB)
    }
    
    static var color_CCCCCC: UIColor {
        return bgColorHEX(0xCCCCCC)
    }
    
    static var color_357CA0: UIColor {
        return bgColorHEX(0x357CA0)
    }
    
    static var randomRGB:UIColor {
        return UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
    }

//    
//    static func defaultBackgroundColor() -> UIColor{
//        return bgColorHEX(0xEEEEEE)
//    }
//    
//    static func defaultTheme() -> UIColor {
//        return bgColorHEX(0xFF5033)
//    }
    
}
