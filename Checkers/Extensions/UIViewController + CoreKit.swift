//
//  UIViewController + CoreKit.swift
//  Lesson13
//
//  Created by Станислав Гусев on 24.01.22.
//

import UIKit

extension UIViewController {
    static var getInstanceViewController: UIViewController? {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController()
    }
    
    static func getViewController(with identifier: String) -> UIViewController? {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
}
