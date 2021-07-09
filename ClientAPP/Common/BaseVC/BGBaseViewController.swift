//
//  BGBaseViewController.swift
//  VTime
//
//  Created by 冉彬 on 2019/10/24.
//  Copyright © 2019 Bingle. All rights reserved.
//

import UIKit

class BGBaseViewController: UIViewController {

    var isHiddenNav = false // 是否隐藏导航栏
    
    // 是否隐藏返回按钮
    var isHiddenBackBtn : Bool = false {
        didSet {
            if isHiddenBackBtn {
                navigationItem.leftBarButtonItem?.isEnabled = false
                navigationItem.leftBarButtonItem = nil
            }else {
                self.setNavigationReturnBtn()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let _isHiddenBackBtn = self.isHiddenBackBtn
        self.isHiddenBackBtn = _isHiddenBackBtn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(isHiddenNav, animated: animated)
        
    }
    
    
    deinit {
        NSLog("%@：被销毁了。", self)
    }
    
    //在这里全局设置状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }

    
    func setNavigationReturnBtn() {
        // 返回按钮
        let backButton = UIButton(type: .custom)
        // 给按钮设置返回箭头图片
        backButton.setImage(UIImage(named: "nav_back"), for: .normal)
        backButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        // 设置frame
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        backButton.addClickEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backButton)
        // 返回按钮设置成功
        navigationItem.leftBarButtonItem = backView
    }
    
    func setNavBackButton(btnStr:String) {
        // 返回按钮
        let backButton = UIButton(type: .custom)
        // 给按钮设置返回箭头图片
        backButton.setImage(UIImage(named: btnStr), for: .normal)
        backButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        // 设置frame
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        backButton.addClickEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backButton)
        // 返回按钮设置成功
        navigationItem.leftBarButtonItem = backView
    }
    
    func setNavRightButton(btnStr:String){
        let rightButton = UIButton(type: .custom)
        // 给按钮设置返回箭头图片
        rightButton.setImage(UIImage(named: btnStr), for: .normal)
        rightButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        // 设置frame
        rightButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        backButton.addClickEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        rightButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let rightView = UIBarButtonItem(customView: rightButton)
        // 返回按钮设置成功
        navigationItem.rightBarButtonItem = rightView
    }
    
    func setNavTitle(title:String) {
        self.setNavTitle(title: title, color: .lightGray);
    }
    func setNavTitle(title:String,color:UIColor) {
        
        let label:UILabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 180, height: 44));
        label.textAlignment = NSTextAlignment.center;
        label.text = title;
        label.textColor = color;
        label.font = UIFont.systemFont(ofSize: 18);
        self.navigationItem.titleView = label;
    }
    func setNavTitleColor(color:UIColor) {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:color,

                                                                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
    }
    
    @objc func back() {
        
        let viewcontrollers = self.navigationController?.viewControllers
        if viewcontrollers?.count ?? 0 > 1 {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.navigationController?.dismiss(animated: true, completion: {
                //
            })
        }
        
        
        
    }
    
    @objc func rightAction(){
        
        
    }
    
}



//MARK: 解决自定义返回按钮后侧滑返回失效
private var popDelegateKey: String = "popDelegate"
extension UINavigationController: UINavigationControllerDelegate {
    
    
    var popDelegate: UIGestureRecognizerDelegate? {
        get {
            return (objc_getAssociatedObject(self, &popDelegateKey) as? UIGestureRecognizerDelegate)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &popDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    // MARK: - UINavigationControllerDelegate方法
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        if viewController == self.viewControllers[0] {
            
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        }
        else {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }
    
    
}

