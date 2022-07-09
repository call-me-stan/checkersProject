//
//  Checker.swift
//  Checkers
//
//  Created by Станислав Гусев on 16.04.2022.

import Foundation
//import UIKit

class Checker: NSObject, NSCoding, NSSecureCoding {
    var firsthPlayerName: String?
    var secondPlayerName: String?
    var winner: String?
    var timer: String?
    var date: String?

    static var supportsSecureCoding: Bool = true

    var checkerNumberCell: Int
    var checkerColor: CheckerColor

    init(checkerNumberCell: Int, checkerColor: CheckerColor) {
        self.checkerNumberCell = checkerNumberCell
        self.checkerColor = checkerColor
    }

    func encode(with coder: NSCoder) {
        coder.encode(checkerNumberCell, forKey: "checkerNumberCell")
        coder.encode(checkerColor, forKey: "checkerColor")
    }

    required init?(coder: NSCoder) {
        self.checkerNumberCell = coder.decodeInteger(forKey: "checkerNumberCell")
        let checkerColorString = coder.decodeObject(forKey: "checkerImage") as? String
        self.checkerColor = CheckerColor(rawValue: checkerColorString ?? "") ?? .whiteChecker
    }
}




//enum CheckerImage: String, Codable {
//
//    case blackChecker, whiteChecker
//
//    var image: UIImage {
//        return UIImage(named: "\(self.rawValue).png") ?? UIImage()
//    }
//}

//class Checker: NSObject, NSCoding, NSSecureCoding {
//
//    static var supportsSecureCoding: Bool = true
//
//    var checkerNumberCell: Int
//    var checkerImage: String = ""
//    var size: CGSize = .zero
//
//    init(checkerNumberCell: Int, checkerImage: String, size: CGSize) {
//        self.checkerNumberCell = checkerNumberCell
//        self.checkerImage = checkerImage
//        self.size = size
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(checkerNumberCell, forKey: "checkerNumberCell")
//        coder.encode(checkerImage, forKey: "checkerImage")
//        coder.encode(size, forKey: "size")
//    }
//
//    required init?(coder: NSCoder) {
//        self.checkerNumberCell = coder.decodeInteger(forKey: "checkerNumberCell")
//        self.checkerImage = (coder.decodeObject(forKey: "checkerImage") as? String) ?? ""
//        self.size = coder.decodeCGSize(forKey: "size")
//    }
//}
//
//
