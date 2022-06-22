//
//  ChessboardViewController.swift
//  Checkers
//
//  Created by Станислав Гусев on 26.02.2022.

import UIKit

class ChessboardViewController: UIViewController {
    
    @IBOutlet weak var firsthPlayerNameLabel: UILabel?
    @IBOutlet weak var chessboard: UIView!
    @IBOutlet weak var resetButton: UIButton!
    
    let board = Chessboard()
    
    var checkers = [Checker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firsthPlayerNameLabel?.text = "\(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") as? String ?? "")"
        
        view.layoutIfNeeded()
        board.createBoard(with: chessboard)
        ifGameWillLoad()
        currentTheme()
        resetButtonIsEnable()
    }
    
    private func currentTheme() {
        if Settings.shared.theme == .dark {
           self.view.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        }
    }
    
    private func ifGameWillLoad() {
        if Settings.shared.saveGame != false {
            loadBoard()
        } else {
            UserDefaults.standard.removeObject(forKey: "Checkers")
        }
    }
    
    private func resetButtonIsEnable() {
        if UserDefaults.standard.object(forKey: "Checkers") != nil {
            resetButton.isEnabled = true
        } else {
            resetButton.isEnabled = false
        }
    }
    
    private func loadBoard() {
        //            firsthPlayerNameLabel?.text = UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") as? String
        for square in chessboard.subviews {
            square.subviews.first?.removeFromSuperview()
        }
        if let data = UserDefaults.standard.object(forKey: "Checkers") as? Data {
            if let checkers = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Checker]{
                self.checkers = checkers
            }
        }
        for (index, square) in chessboard.subviews.enumerated() {
            if let checker = self.checkers.first(where: { $0.checkerNumberCell == index}) {
                if square.subviews.isEmpty {
                    let checkerImage = CheckerImage(rawValue: checker.checkerImage) ?? .whiteChecker
                    let addChecker = checker.createChecker(checkerImage: checkerImage, size: checker.size)
                    square.addSubview(addChecker)
                    addChecker.center = CGPoint(x: square.bounds.width / 2.0,
                                                y: square.bounds.height / 2.0)
                }
            }
        }
    }
    
}

extension ChessboardViewController {
    
    @IBAction func saveChessboard(_ sender: Any) {
        showSaveAlert()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        showResetAlert()
    }
    
    private func showSaveAlert() {
        let alert = UIAlertController(title: "Save the game", message: "Do you really want to save the game?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.saveGame()
            self.resetButtonIsEnable()
            
            print(Settings.shared.saveGame)
            print(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") ?? "")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showResetAlert() {
        let alert = UIAlertController(title: "Reset the game", message: "Do you really want to reset the game?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.resetGame()
            self.resetButtonIsEnable()
            
            print(Settings.shared.saveGame)
            print(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") ?? "")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func saveGame() {
        Settings.shared.saveGame = true
        
        for cell in self.chessboard.subviews {
            if !cell.subviews.isEmpty {
                self.checkers.append(Checker(checkerNumberCell: (cell as? SquareView)?.numberCell ?? -1,
                                             checkerImage: (cell.subviews.first as? CheckerImageView)?.nameImage ?? "",
                                             size: cell.subviews.first?.bounds.size ?? .zero))
            }
        }
        
        self.checkers.forEach({
            print($0.checkerNumberCell)
        })
        
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: self.checkers, requiringSecureCoding: true) {
            UserDefaults.standard.set(data, forKey: "Checkers")
        }
    }
    
    private func resetGame() {
        //        UserDefaults.standard.removeObject(forKey: "firsthPlayerNameLabel")
        UserDefaults.standard.removeObject(forKey: "Checkers")
        for square in chessboard.subviews {
            square.subviews.first?.removeFromSuperview()
            chessboard.subviews.first?.removeFromSuperview()
        }
        board.createBoard(with: chessboard)
        
        Settings.shared.saveGame = false
    }
}
