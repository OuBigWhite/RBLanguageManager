//
//  Bundle+RBLanguage.swift
//  多语言
//
//  Created by 冉彬 on 2020/12/24.
//

import Foundation

extension Bundle {
    
    
    static func rb_loadLanguage(){
        Bundle.loadLanguageDispatchOnce()
    }
    
    private static var loadLanguageDispatchOnce: ()->Void = {
        //替换Bundle.main为自定义的BundleEx
        object_setClass(Bundle.main, BundleEx.self)
    }
    
    class func getLanguageBundel() -> Bundle? {
        let languageBundlePath = Bundle.main.path(forResource: RBLanguageManager.shared.currentLanguage.rawValue, ofType: "lproj")
        guard languageBundlePath != nil else {
            return nil
        }
        let languageBundle = Bundle.init(path: languageBundlePath!)
        guard languageBundle != nil else {
            return nil
        }
        return languageBundle!
        
    }
}


/**
 *  当调用onLanguage后替换掉mainBundle为当前语言的bundle
 */

class BundleEx: Bundle {
    
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getLanguageBundel() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        }else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
