//
//  Settings.swift
//  Checkers
//
//  Created by Станислав Гусев on 14.05.2022.
//

import UIKit

class Settings: NSObject {
//    enum CurrentTheme: Int {
//        case light = 10
//        case dark = 11
//    }
//
//    enum ThemeIsSave: String {
//        case gameTheme
//    }
    
    enum GameIsSavedKeys: String {
        case saveGame
        case darkTheme
    }
    
    static let shared = Settings()
    
    var saveGame: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: GameIsSavedKeys.saveGame.rawValue)
        }
        
        get {
            return UserDefaults.standard.bool(forKey: GameIsSavedKeys.saveGame.rawValue)
        }
    }
    
    var darkTheme: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: GameIsSavedKeys.darkTheme.rawValue )
        }
        
        get {
            return UserDefaults.standard.bool(forKey: GameIsSavedKeys.darkTheme.rawValue)
        }
    }
    
//    var theme: CurrentTheme {
//        set {
//            UserDefaults.standard.set(newValue.rawValue, forKey: ThemeIsSave.gameTheme.rawValue )
//        }
//
//        get {
//            return CurrentTheme(rawValue: UserDefaults.standard.integer(forKey: ThemeIsSave.gameTheme.rawValue)) ?? .light
//        }
//    }
    
}
