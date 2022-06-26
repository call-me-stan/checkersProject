//
//  String + CoreKit.swift
//  Checkers
//
//  Created by Станислав Гусев on 26.06.2022.
//

import Foundation

extension String {
    var localized: String {
        guard let url = Bundle.main.url(forResource: Settings.shared.currentLanguageCode, withExtension: "lproj"),
              let langBundle = Bundle(url: url) else {
            return self
        }
        
        return NSLocalizedString(self, bundle: langBundle, comment: "")
    }
}
