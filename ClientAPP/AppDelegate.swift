//
//  AppDelegate.swift
//  ClientAPP
//
//  Created by 冉彬 on 2020/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("系统：" + UIDevice.current.systemVersion)
        print("uuid：" + UUID().uuidString)
        print("当前语言：" + RBLanguageManager.shared.languageName)
        //加载多语言模块（xib多语言要用）
        RBLanguageManager.loadManager()
        
        window = UIWindow.init()
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
//        window?.rootViewController = MainTabbarController()
        
        
        if self.isFristRun()
        {
            self.gotoGuideVC()
        }
        else
        {
            if self.isLogin() {
                self.gotoMainVC()
            }
            else {
                self.gotoLoginVC()
            }
            
        }
        
        return true
    }
    
    
    /// 跳转到主界面
    func gotoMainVC() {
        window?.rootViewController = MainTabbarController()
    }
    
    /// 跳转到登录界面
    func gotoLoginVC() {
        window?.rootViewController = MainTabbarController()
    }
    
    /// 跳转到引导页
    func gotoGuideVC() {
        window?.rootViewController = MainTabbarController()
    }
    
    /// 判断当前版本是否是第一次打开
    func isFristRun() -> Bool{
//        //主程序版本号
//        let infoDictionary = Bundle.main.infoDictionary!
//        let majorVersion = infoDictionary["CFBundleShortVersionString"] as! String
//
//        //上次启动的版本号
//        let lastLaunchVersion = UserDefaults.APPInfo.string(forKey: .version)
//
//        //版本号比较
//        let isFirstLaunchOfNewVersion = majorVersion != lastLaunchVersion
//        if isFirstLaunchOfNewVersion {
//            UserDefaults.APPInfo.set(value: majorVersion, forKey:
//                                        .version)
//        }
//
////        return false // 不跳转到引导页
//        return isFirstLaunchOfNewVersion
        return false
    }
    
    /// 判断是否登录
    func isLogin() -> Bool {
        return true
//        // 获取登录token
//        let token = UserDefaults.LoginInfo.string(forKey: .token)
//        if (token != nil) {
//            return true
//        }
//        else
//        {
//            return false
//        }
        
        
    }
    


}

