//
//  Chessboard + gameIsOver.swift
//  Checkers
//
//  Created by Станислав Гусев on 02.07.2022.
//

import UIKit

extension Chessboard {
    func gameOver() {
        if blackMustBeat == 12 || whiteMustBeat == 12 {
//            AudioManager.shared.playSoundPlayer(with: SoundsChoice.salute.rawValue)
//            animationView.isHidden = false
//            view.bringSubviewToFront(animationView)
            showFinishGameAlert()
        }
    }
    
    private func showFinishGameAlert(){
        print("The Game is over")
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "d MMM yyyy \nHH:mm:ss"
//        let date = dateFormatter.string(from: Date())
//
//        let winner: String?
//        if beatWhiteCheckers == 12 {
//            winner = Setting.shared.namePlayerSecond
//        } else {
//            winner = Setting.shared.namePlayer
//        }
//        checkersDB.append(Checkers(namePlayer: Setting.shared.namePlayer,
//                                   namePlayerSecond: Setting.shared.namePlayerSecond,
//                                   winner: winner,
//                                   timer: timerLabel.text,
//                                   date: date))
//        CoreDataManager.shared.saveScoreInDB(checkers: checkersDB)
//
//        timer.invalidate()
//        let alert = UIAlertController(title: "Finish game", message:  (winner ?? "He") + " is winner!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
//            AudioManager.shared.clearSoundPlayer()
//            self.animationView.isHidden = true
//            guard let scoreVC = ScoreGameViewController.getInstanceController as? ScoreGameViewController else {return}
//            scoreVC.modalPresentationStyle = .fullScreen
//            scoreVC.modalTransitionStyle = .crossDissolve
//            self.present(scoreVC, animated: true, completion: nil)
//        }))
//        self.present(alert, animated: true, completion: nil)
    }
}
