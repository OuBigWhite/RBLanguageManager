//
//  TestXibVC.swift
//  ClientAPP
//
//  Created by 冉彬 on 2020/12/25.
//

import UIKit

class TestXibVC: BGBaseViewController {

    @IBOutlet weak var tlable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = .loc_test_title
        self.tlable.text = .loc_中文测试文字

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
