//
//  BGConfig.swift
//  VTime
//
//  Created by 冉彬 on 2019/10/24.
//  Copyright © 2019 Bingle. All rights reserved.
//

import UIKit


extension UIWindow {
    
}

let isTest = true
let testHost = "http://"
let formalHost = "http://"//

let testResourceHost = "http://"
let formalResourceHost = "http://"

let testScan = "http://"
let formalScan = "http://"


let hostString = (isTest ? testHost : formalHost)
let resourceHost = isTest ? testResourceHost : formalResourceHost
let scanHost = (isTest ? testScan : formalScan)

let screenWidth = UIScreen.main.bounds.size.width
let screentHeight = UIScreen.main.bounds.size.height

let defauleNoImage = "def_noImage"

// 底部安全距离
let bottomSafeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0

//顶部的安全距离
let topSafeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0

//状态栏高度
let statusBarHeight = UIApplication.shared.statusBarFrame.height;

//状态栏高度
let topHeight = topSafeAreaHeight > 0 ? topSafeAreaHeight : 20

//导航栏高度
let navigationHeight = CGFloat(44)
 
//导航栏高度+状态栏
let navHeight    = topSafeAreaHeight + 44;

//tabbar高度
let tabbarHeight = bottomSafeAreaHeight + 49;

let appBounds = UIScreen.main.bounds

let appWindow = UIApplication.shared.keyWindow

//输入框边距
let textSpaceH  = 28;

//大标题导航栏高度
let bignavH = CGFloat(64)

let windowTag = 999999

let fxPageSize = 20


/// 颜色
func bgColorHEX(_ hexColor: Int) -> UIColor! {
    let color = UIColor(red: ((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.0,
                        green: ((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.0,
                        blue: ((CGFloat)(hexColor & 0xFF)) / 255.0,alpha: 1.0)
    
    
    return color 
}

func bgColorHEX(hexColor: Int, alpha: Float) -> UIColor! {
    return UIColor(red: ((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.0,
    green: ((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.0,
    blue: ((CGFloat)(hexColor & 0xFF)) / 255.0,alpha: CGFloat(alpha))
}

/// 截屏
//func screenSnapshot() -> UIImage? {
//    let screenRect = UIScreen.main.bounds
//    UIGraphicsBeginImageContext(screenRect.size)
//    let ctx:CGContext = UIGraphicsGetCurrentContext()!
//    guard let window = UIApplication.shared.keyWindow else { return nil }
//    window.layer.render(in: ctx)
//    let image = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext();
//    return image
//}
func screenSnapshot() -> UIImage? {
        guard UIScreen.main.bounds.size.height > 0 && UIScreen.main.bounds.size.width > 0 else {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, true, UIScreen.main.scale)
        guard let window = UIApplication.shared.keyWindow else { return nil }
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)  // 高清截图
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }

/// 圆角
/// - Parameters:
///   - view: view
///   - radiu: 圆半径
func cornerView(view: UIView, radiu: CGFloat) {
    view.layer.cornerRadius = radiu
    view.layer.masksToBounds = true
}

/// 圆角边框
/// - Parameters:
///   - view: view
///   - radii: 圆半径
///   - width: 边框宽
///   - color: 边框颜色
func cornerView(view: UIView, radiu: CGFloat, width: CGFloat, color: UIColor) {
    view.layer.cornerRadius = radiu
    view.layer.masksToBounds = true
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}

/// 高性能圆角边框(在界面将显示时调用)
/// - Parameters:
///   - view: view
///   - radii: 半径
///   - width: 边框宽
///   - color: 边框颜色
func highCornerView(view: UIView, radiu: CGFloat, width: CGFloat, color: UIColor) {
    
    view.superview?.layoutIfNeeded()
    let maskPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight, .bottomLeft], cornerRadii: CGSize(width: radiu, height: radiu))
    let maskLayer = CAShapeLayer.init()
    maskLayer.frame = view.bounds
    maskLayer.path = maskPath.cgPath
    view.layer.mask = maskLayer
    
    let borderLayer = CAShapeLayer()
    borderLayer.frame = view.bounds
    borderLayer.path = maskPath.cgPath
    borderLayer.lineWidth = width;
    borderLayer.fillColor = UIColor.clear.cgColor
    borderLayer.strokeColor = color.cgColor
    view.layer.addSublayer(borderLayer)
}

/**
 字典转换为JSONString
 
 - parameter dictionary: 字典参数
 
 - returns: JSONString
 */
func getJsonStringFromDictionary(dictionary:NSDictionary) -> String {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String

}

/// 获取当前时间戳
func getNowTimeStamp() -> String {
    //获取当前时间
    let now = Date()
    //当前时间的时间戳
    let timeInterval:TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}

/// 获取当前时间
/// - Parameter dateFormat: 时间格式（如：yyyy-MM-dd HH:mm:ss）
func getNowTimeString(dateFormat: String) -> String {
    //获取当前时间
    let now = Date()
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = dateFormat
    return dformatter.string(from: now)
}


/**

* 设置uiview的任意边款

**/

func SetBorderWithView(_ view:UIView,top:Bool,left:Bool,bottom:Bool,right:Bool,width:CGFloat,color:UIColor) {
    if top {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: width)
        layer.backgroundColor = color.cgColor
        view.layer.addSublayer(layer)
    }

    if left {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: view.frame.size.height)
        layer.backgroundColor = color.cgColor
        view.layer.addSublayer(layer)
    }

    if bottom {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: view.frame.size.height - width, width: view.frame.size.width, height: width)
        layer.backgroundColor = color.cgColor
        view.layer.addSublayer(layer)
    }

    if right {
        let layer = CALayer()
        layer.frame = CGRect(x: view.frame.size.width - width, y: 0, width: width, height: view.frame.size.height)
        layer.backgroundColor = color.cgColor
        view.layer.addSublayer(layer)
    }
}

/**

* 设置uiview的任意圆角

**/

func SetMutiBorderRoundingCorners(_ view:UIView,corner:CGFloat) {
    let maskPath = UIBezierPath.init(roundedRect: view.bounds,
    byRoundingCorners:[UIRectCorner.bottomLeft, UIRectCorner.bottomRight],
    cornerRadii: CGSize(width: corner, height: corner))
    let maskLayer = CAShapeLayer()
    maskLayer.frame = view.bounds
    maskLayer.path = maskPath.cgPath
    view.layer.mask = maskLayer
}

func SetRoundingCorners(_ view:UIView,corner:CGFloat,rectCorners:UIRectCorner) {
    let maskPath = UIBezierPath.init(roundedRect: view.bounds,
    byRoundingCorners:rectCorners,
    cornerRadii: CGSize(width: corner, height: corner))
    let maskLayer = CAShapeLayer()
    maskLayer.frame = view.bounds
    maskLayer.path = maskPath.cgPath
    view.layer.mask = maskLayer
}

//验证邮箱
func validateEmail(email: String) -> Bool {
    if email.count == 0 {
        return false
    }
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}

//邮政编码
func isVerifyZipCode(text:String) -> Bool {
    let predicateStr = "^\\d{5}$"
    let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
    return predicate.evaluate(with: text)
}

func getNumStr(num: Int) -> String {
    if num >= 1000 {
        return "999+"
    }
    return String(format: "%d", num)
}

func stringToTimeStamp(stringTime: String, format: String) -> Int {
    let dfmatter = DateFormatter()
    if format.count <= 0 {
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    } else {
        dfmatter.dateFormat = format
    }
    let date = dfmatter.date(from: stringTime)
    let dateStamp:TimeInterval = date!.timeIntervalSince1970
    return Int(dateStamp)
}

func getNowTimestampWithDate(date:Date) -> Int {
    // 创建一个日期格式器
    let  formatter =  DateFormatter()
    formatter.dateFormat =  "yyyy-MM-dd HH:mm:ss"
    //当前时间的时间戳
    let  timeInterval: TimeInterval  = date.timeIntervalSince1970
    return Int(timeInterval)
}

