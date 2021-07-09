//
//  CLMessageVC.swift
//  ClientAPP
//
//  Created by 冉彬 on 2020/12/25.
//

import UIKit

class CLMessageVC: BGBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton(frame: CGRect(x: 10, y: 80, width: 200, height: 45))
        btn.backgroundColor = .red
        btn.setTitle(.loc_登录, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        self.view.addSubview(btn)
//        btn.addClickAction {[weak self] (_) in
//            let vc = UINavigationController(rootViewController: CLLoginVC())
//            vc.modalPresentationStyle = .overFullScreen
//            self?.navigationController?.tabBarController?.present(vc, animated: true, completion: {
//                //
//            })
//        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
