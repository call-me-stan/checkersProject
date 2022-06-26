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
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = true
    
    let board = Chessboard()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        firsthPlayerNameLabel?.text = "\(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") as? String ?? "")"
        count = UserDefaults.standard.integer(forKey: "count")
        
        view.layoutIfNeeded()
        setLocalization()
        board.createBoard(with: chessboard)
        ifGameWillLoad()
        currentTheme()
        resetButtonIsEnable()
        startTimer()
    }
    
    private func startTimer() {
        if timerCounting == true {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
        }
    }
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let timer = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: timer.0, seconds: timer.1)
        timerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> ( Int, Int) {
        return (((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    private func setLocalization(){
        saveButton.setTitle("saveButton_text".localized, for: .normal)
        resetButton.setTitle("resetButton_text".localized, for: .normal)
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
//            count = UserDefaults.standard.integer(forKey: "count")
        } else {
            UserDefaults.standard.removeObject(forKey: "Checkers")
            UserDefaults.standard.removeObject(forKey: "count")
            self.count = UserDefaults.standard.integer(forKey: "count")
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
        self.timer.invalidate()
        showSaveAlert()
    }
    
    @IBAction func resetGame(_ sender: Any) {
        showResetAlert()
    }
    
    private func showSaveAlert() {
        let alert = UIAlertController(title: "saveTheGame_text".localized, message: "wantSaveGame_text".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes_text".localized, style: .default, handler: { action in
            self.board.saveGame(with: self.chessboard)
            self.resetButtonIsEnable()
            self.startTimer()
            UserDefaults.standard.set(self.count, forKey: "count")

            print(Settings.shared.saveGame)
            print(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") ?? "")
        }))
        alert.addAction(UIAlertAction(title: "no_text".localized, style: .destructive, handler: { action in
            self.startTimer()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showResetAlert() {
        let alert = UIAlertController(title: "resetTheGame_text".localized, message: "reallyResetGame_text".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes_text".localized, style: .default, handler: { action in
            self.board.resetGame(with: self.chessboard)
            self.resetButtonIsEnable()
            self.count = UserDefaults.standard.integer(forKey: "count")
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(minutes: 0, seconds: 0)
            self.startTimer()
            
            print(Settings.shared.saveGame)
            print(UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") ?? "")
        }))
        alert.addAction(UIAlertAction(title: "no_text".localized, style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
