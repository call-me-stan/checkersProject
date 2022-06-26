//
//  Settings.swift
//  Checkers
//
//  Created by Станислав Гусев on 14.05.2022.
//

import UIKit

class Settings: NSObject {
    
    enum UserDefaultsKeys: String {
        case saveGame
        case darkTheme
        case language
    }
    
    let lanCode = ["en", "ru"]
    
    static let shared = Settings()
    
    var saveGame: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.saveGame.rawValue)
        }
        
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.saveGame.rawValue)
        }
    }
    
    var darkTheme: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.darkTheme.rawValue )
        }
        
        get {
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.darkTheme.rawValue)
        }
    }
    
    var currentLanguageCode: String {
        set {
            if let index = lanCode.firstIndex(of: newValue) {
                UserDefaults.standard.set(index, forKey: UserDefaultsKeys.language.rawValue)
            }
            NotificationCenter.default.post(name: NSNotification.Name("LanguageDidChange"), object: nil)
        }
        
        get {
            let indexCode = UserDefaults.standard.integer(forKey: UserDefaultsKeys.language.rawValue)
            return lanCode[indexCode]
        }
    }
}
