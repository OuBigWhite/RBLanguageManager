//
//  UIButton+Build.swift
//  LiuDaKe
//
//  Created by 冉彬 on 2020/10/12.
//  Copyright © 2020 BigWhite. All rights reserved.
//

import Foundation
import UIKit


extension UIButton{
    
    
    
    /// 根据文字创建按钮
    /// - Parameters:
    ///   - title: 文字
    ///   - font: 字体
    ///   - titleColor: 字体颜色
    /// - Returns: 按钮
    static func buildBtn(title: String, font: UIFont, titleColor: UIColor) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.backgroundColor = .clear
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = font
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        label.text = title
        label.textColor = titleColor
        label.font = font
        label.sizeToFit()
//        btn.addSubview(label)
        var frame = btn.frame
        frame.size.width = label.frame.size.width
        frame.size.height = label.frame.size.height
        btn.frame = frame
        
        return btn

    }
}
