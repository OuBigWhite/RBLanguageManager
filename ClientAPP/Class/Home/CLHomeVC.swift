//
//  CLHomeVC.swift
//  ClientAPP
//
//  Created by 冉彬 on 2020/12/23.
//

import UIKit

class CLHomeVC: BGBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHiddenNav = true // 隐藏导航栏
        // Do any additional setup after loading the view.
        loadUI()
        
    }
    
    func loadUI() {
        let btn = UIButton(frame: CGRect(x: 10, y: 80, width: 300, height: 44))
        btn.backgroundColor = .cyan
        btn.setTitle(.loc_切换语言, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.black, for: .normal)
        btn.addClickAction { (_) in
            RBLanguageManager.shared.currentLanguage = (RBLanguageManager.shared.currentLanguage == .english) ? .chinese : .english
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.gotoMainVC()
        }
        self.view.addSubview(btn)
        
        let btn1 = UIButton(frame: CGRect(x: 10, y: 200, width: 300, height: 44))
        btn1.backgroundColor = .cyan
        btn1.setTitle(.loc_跳转按钮, for: .normal)
        btn1.titleLabel?.font = .systemFont(ofSize: 14)
        btn1.setTitleColor(.black, for: .normal)
        btn1.addClickAction { (_) in
            let vc = TestXibVC(nibName: "TestXibVC", bundle: Bundle.main)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.view.addSubview(btn1)
    }
    

}
