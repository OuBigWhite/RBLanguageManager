//
//  RBLanguageManager.swift
//  多语言
//
//  Created by 冉彬 on 2020/12/24.
//

import UIKit

let RBLanguageManagerKey = "RBLanguageManagerKey"
let RBLanguageDic = [
    Language.english: "en-CN",
    Language.chinese: "zh-Hans-CN"
]


enum Language : String {
    case english = "en"
    case chinese = "zh-Hans"
}

class RBLanguageManager {
    static let shared = RBLanguageManager()
    // Initialization
    private init() {
        
    }
    
    
    /// 加载
    class func loadManager() {
        Bundle.rb_loadLanguage()
    }
    
    lazy private var _currentLanguage: Language = {
        var language: String? = UserDefaults.standard.value(forKey: RBLanguageManagerKey) as? String
        if language == nil {
            let languages = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
            if languages?.count ?? 0 > 0 {
                language = self.getLanguageString(str: languages![0]).rawValue
                
            } else {
                language = Language.english.rawValue
                UserDefaults.standard.setValue(language, forKey: RBLanguageManagerKey)
                UserDefaults.standard.setValue([RBLanguageDic[Language.english]], forKey: "AppleLanguages")
            }
        }
        let lan = Language(rawValue: language!)
        if lan == nil {
            language = Language.english.rawValue
            UserDefaults.standard.setValue(language, forKey: RBLanguageManagerKey)
            UserDefaults.standard.setValue([RBLanguageDic[Language.english]], forKey: "AppleLanguages")
        }
        
        return Language(rawValue: language!)!
    }()
    
    
    // 当前语言
    var currentLanguage: Language {
        get {
            return _currentLanguage
        }
        set {
            _currentLanguage = newValue
            UserDefaults.standard.setValue(newValue.rawValue, forKey: RBLanguageManagerKey)
            UserDefaults.standard.setValue([RBLanguageDic[newValue]], forKey: "AppleLanguages")
        }
    }
    
    var languageName: String {
        get {
            switch self.currentLanguage {
            
            case .chinese:
                return "简体中文"
            case .english:
                return "英语"
            }
        }
    }
    
    
    
    func getLanguageString(str: String) -> Language {
        for (key, vs) in RBLanguageDic {
            if vs == str {
                return key
            }
        }
        return .english
        
        
    }
    
    
    
    
    
}
