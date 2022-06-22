//
//  Checker.swift
//  Checkers
//
//  Created by Станислав Гусев on 16.04.2022.

import UIKit

enum CheckerImage: String, Codable {
    
    case blackChecker, whiteChecker
    
    var image: UIImage {
        return UIImage(named: "\(self.rawValue).png") ?? UIImage()
    }
}

class Checker: NSObject, NSCoding, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = true
    
    var checkerNumberCell: Int
    var checkerImage: String = ""
    var size: CGSize = .zero
    
    init(checkerNumberCell: Int, checkerImage: String, size: CGSize) {
        self.checkerNumberCell = checkerNumberCell
        self.checkerImage = checkerImage
        self.size = size
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(checkerNumberCell, forKey: "checkerNumberCell")
        coder.encode(checkerImage, forKey: "checkerImage")
        coder.encode(size, forKey: "size")
    }
    
    required init?(coder: NSCoder) {
        self.checkerNumberCell = coder.decodeInteger(forKey: "checkerNumberCell")
        self.checkerImage = (coder.decodeObject(forKey: "checkerImage") as? String) ?? ""
        self.size = coder.decodeCGSize(forKey: "size")
    }
    
    func createChecker(checkerImage: CheckerImage, size: CGSize) -> UIView {
        let checker = CheckerImageView(frame: CGRect(origin: .zero, size: size))
        checker.isUserInteractionEnabled = true
        checker.layer.cornerRadius = size.width / 2.0
        checker.image = checkerImage.image
        checker.nameImage = checkerImage.rawValue
        self.checkerImage = checkerImage.rawValue
        self.size = size
        checker.contentMode = .scaleToFill
        
        
        return checker
    }
}


