//
//  UIButton+Action.swift
//  VTime
//
//  Created by 冉彬 on 2019/11/20.
//  Copyright © 2019 Bingle. All rights reserved.
//

import Foundation
import UIKit


typealias BtnAction = (UIButton)->()
typealias BoolAction = (Bool)->()
typealias CallBack = (Any)->()

extension UIButton{
    private struct AssociatedKeys{
        static var actionKey = "actionKey"
    }
    
    @objc dynamic var action: BtnAction? {
        set{
            objc_setAssociatedObject(self,&AssociatedKeys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get{
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? BtnAction{
                return action
            }
            return nil
        }
    }
    
    /// 添加一个点击事件
    /// - Parameter action: 点击时执行的闭包
    @discardableResult //消除未使用返回值时的警告
    func addClickAction(action:@escaping BtnAction) -> UIButton {
        return self.addEvent(event: .touchUpInside, action: action)
    }
    
    
    /// 添加一个事件
    /// - Parameters:
    ///   - event: 添加的事件
    ///   - action: 事件响应时执行的闭包
    @discardableResult //消除未使用返回值时的警告
    func addEvent(event:UIControl.Event, action:@escaping  BtnAction ) -> UIButton{
        self.action = action
        self.addTarget(self, action: #selector(touchUpInSideBtnAction), for: event)
        return self
    }

    @objc func touchUpInSideBtnAction(btn: UIButton) {
         if let action = self.action {
             action(btn)
         }
    }
    
    
    @discardableResult //消除未使用返回值时的警告
    func addCountdown(time:Int, endAction:@escaping ()->()) -> UIButton {
        //倒计时时间
        var timeout = time
        let queue:DispatchQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        let _timer:DispatchSource = DispatchSource.makeTimerSource(flags: [], queue: queue) as! DispatchSource
        _timer.schedule(wallDeadline: DispatchWallTime.now(), repeating: .seconds(1))
        //每秒执行
        _timer.setEventHandler(handler: { () -> Void in
            if(timeout<=0){ //倒计时结束，关闭
                _timer.cancel();
                DispatchQueue.main.sync(execute: { () -> Void in
                    self.isEnabled = true
                    endAction()
                })
            }else{//正在倒计时
                let seconds = timeout
                DispatchQueue.main.sync(execute: { () -> Void in
                    let str = String(describing: seconds)
                    let s = "秒"
                    self.titleLabel?.text = "\(str)\(s)"
                    self.setTitle("\(str)\(s)", for: .normal)
                    self.isEnabled = false
                })
                timeout -= 1;
            }
        })
        _timer.resume()
        return self
    }
    
    
    
    // 改进写法【推荐】
    private struct RuntimeKey {
        static let clickEdgeInsets = UnsafeRawPointer.init(bitPattern: "clickEdgeInsets".hashValue)
        /// ...其他Key声明
    }
    /// 需要扩充的点击边距
    public var addClickEdgeInsets: UIEdgeInsets? {
        set {
            objc_setAssociatedObject(self, UIButton.RuntimeKey.clickEdgeInsets!, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get {
            return objc_getAssociatedObject(self, UIButton.RuntimeKey.clickEdgeInsets!) as? UIEdgeInsets ?? UIEdgeInsets.zero
        }
    }
    // 重写系统方法修改点击区域
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        var bounds = self.bounds
        if (addClickEdgeInsets != nil) {
            let x: CGFloat = -(addClickEdgeInsets?.left ?? 0)
            let y: CGFloat = -(addClickEdgeInsets?.top ?? 0)
            let width: CGFloat = bounds.width + (addClickEdgeInsets?.left ?? 0) + (addClickEdgeInsets?.right ?? 0)
            let height: CGFloat = bounds.height + (addClickEdgeInsets?.top ?? 0) + (addClickEdgeInsets?.bottom ?? 0)
            bounds = CGRect(x: x, y: y, width: width, height: height) //负值是方法响应范围
        }
        return bounds.contains(point)
    }
    
    
}
