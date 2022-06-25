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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    let board = Chessboard()
        
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
        if Settings.shared.darkTheme == true {
            self.view.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            saveButton.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            resetButton.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            saveButton.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            resetButton.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
        }
    }
    
    private func ifGameWillLoad() {
        if Settings.shared.saveGame != false {
            board.loadBoard(with: chessboard)
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
            self.board.saveGame(with: self.chessboard)
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
            self.board.resetGame(with: self.chessboard)
            self.resetButtonIsEnable()
            
            print(Settings.shared.saveGame)
            print(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") ?? "")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
