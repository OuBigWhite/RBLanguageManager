//
//  VMainTabbarController.swift
//  VTime
//
//  Created by 冉彬 on 2019/10/24.
//  Copyright © 2019 Bingle. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    
    
    lazy var homeVC:UINavigationController = {
        var vc = CLHomeVC()
        vc.isHiddenBackBtn = true
        vc.title = .loc_home
        vc.tabBarItem.image = UIImage(named: "tab_home")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "tab_home_sel")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = .loc_home
        return self.getCustomNavigationController(UINavigationController.init(rootViewController: vc))
        
    }()
    
    lazy var planVC:UINavigationController = {
        let vc = CLPlanVC()
        vc.isHiddenBackBtn = true
        vc.title = .loc_plan
        vc.tabBarItem.image = UIImage(named: "tab_plan")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "tab_plan_sel")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = .loc_plan
        return self.getCustomNavigationController(UINavigationController.init(rootViewController: vc))
    }()
    
    lazy var msgVC:UINavigationController = {
        let vc = CLMessageVC()
        vc.isHiddenBackBtn = true
        vc.title = .loc_msg
        vc.tabBarItem.image = UIImage(named: "tab_msg")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "tab_msg_sel")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = .loc_msg
        return self.getCustomNavigationController(UINavigationController.init(rootViewController: vc))
    }()
    
    lazy var mineVC:UINavigationController = {
        let vc = CLMineVC()
        vc.isHiddenBackBtn = true
        vc.title = .loc_mine
        vc.tabBarItem.image = UIImage(named: "tab_mine")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "tab_mine_sel")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = .loc_mine
        return self.getCustomNavigationController(UINavigationController.init(rootViewController: vc))
    }()
    
    lazy var centerBtn : UIButton = {
        // 初始化按钮
        let centerBtn = UIButton()
        // 设置按钮图片
        centerBtn.setImage(UIImage(named: "tab_add"), for: .normal)
        centerBtn.setImage(UIImage(named: "tab_mine_sel"), for: .highlighted)
        centerBtn.imageView?.contentMode = .scaleAspectFit
        // 给按钮添加点击事件
        centerBtn.addTarget(self, action: #selector(centerBtnClick), for: .touchUpInside)
        // 设置按钮的尺寸
        centerBtn.sizeToFit()
        return centerBtn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .lightGray
        
//        let tabbarW = self.tabBar.bounds.size.width
//        let tabbarH = self.tabBar.bounds.size.height + bottomSafeAreaHeight
//        let spaceW = CGFloat(0.5)
        
//        let bgView = UIView(frame: self.tabBar.bounds)
//        bgView.backgroundColor = .white
//        bgView.height = tabbarH
//        self.tabBar.insertSubview(bgView, at: 0)

//        let sView = UIView(frame: CGRect(x: (tabbarW/2 - spaceW/2), y: 0, width: spaceW, height: tabbarH))
//        sView.backgroundColor = bgColorHEX(0xc9c9c9)
//        self.tabBar.insertSubview(sView, at: 1)
//
        self.viewControllers = [self.homeVC, self.planVC, UIViewController(), self.msgVC, self.mineVC];
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerBtn.removeFromSuperview()
        // 添加中间按钮
        // 按钮在viewDidLoad中添加,会被系统的BarButtonItem挡住,处理不了事件了
        // viewWillAppear中添加按钮,在系统的BarButtonItem之后添加
        self.tabBar.addSubview(centerBtn)
        // 设置按钮的位置
        let rect = self.tabBar.frame
        let width = rect.width / CGFloat(children.count)
        centerBtn.frame = CGRect(x: 2 * width, y: 0, width: width, height: rect.height)
    }
    
    
    
    
    
    
    /// 设置自定义导航控制器（导航栏颜色，标题等设置）
    /// - Parameter nav: 需要设置的导航控制器
    func getCustomNavigationController(_ nav: UINavigationController) -> UINavigationController {
        nav.navigationBar.barTintColor = .white //导航栏背景颜色
//        nav.navigationBar.tintColor = .white //导航栏UIBarButtonItem的颜色
//        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
//        nav.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : AnyObject]//导航栏标题的颜色，也可以设置字体大小等
        nav.navigationBar.isTranslucent = false //关键点   它的作用是根据UINavigationBar设置，去判定是否添加透明度。
        return nav;
    }
    
    
    /// 中间➕按钮点击
    /// - Parameter sender: 按钮
    @objc func centerBtnClick(sender: UIButton) {
//        BGPromptView.show(message: "点击了中间按钮")
    }

}
