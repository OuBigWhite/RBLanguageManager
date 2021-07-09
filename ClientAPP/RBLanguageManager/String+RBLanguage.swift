//
//  String+RBLanguage.swift
//  多语言
//
//  Created by 冉彬 on 2020/12/24.
//

import Foundation

extension String {

	static var loc_test_title: String { return "test_title".localizedString }
	static var loc_切换语言: String { return "切换语言".localizedString }
	static var loc_跳转按钮: String { return "跳转按钮".localizedString }
	static var loc_输入手机号: String { return "输入手机号".localizedString }
	static var loc_登录: String { return "登录".localizedString }
	static var loc_手机登录: String { return "手机登录".localizedString }
	static var loc_邮箱登录: String { return "邮箱登录".localizedString }
	static var loc_home: String { return "home".localizedString }
	static var loc_plan: String { return "plan".localizedString }
	static var loc_msg: String { return "msg".localizedString }
	static var loc_mine: String { return "mine".localizedString }
	static var loc_中文测试文字: String { return "中文测试文字".localizedString }


    var localizedString: String {
        let bundle = Bundle.getLanguageBundel()
        if bundle != nil {
            return NSLocalizedString(self, tableName: "RBLanguageString", bundle: bundle!, value: "", comment: "")
        }
        return NSLocalizedString(self, comment: "")
    }
}
