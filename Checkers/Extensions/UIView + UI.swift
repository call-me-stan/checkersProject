//
//  Extension.swift
//  Lesson13
//
//  Created by Андрей Трофимов on 24.01.22.
//

import UIKit

extension UIView {

    @IBInspectable var isNeedBorder: Bool {
        get { return false }
        set {
            layer.borderWidth = newValue ? 4 : 0
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            guard let color = layer.borderColor else {
                return .clear
            }

            return UIColor(cgColor: color)
        }

        set { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable var cornerRadius: CGFloat {

        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue }
    }
}
