//
//  MenuViewController.swift
//  Checkers
//
//  Created by Станислав Гусев on 05.06.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    var player = UITextField()
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var rulesView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var closeButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsIsActive()
        currentTheme()
        
        rulesView.alpha = 0.0
        blurEffect.alpha = 0.0
        closeButtonView.alpha = 0.0
    }
    
    
    
    private func buttonsIsActive() {
        scoreButton.isEnabled = false
//        settingsButton.isEnabled = false
        aboutButton.isEnabled = true
    }
    
    private func currentTheme() {
        if Settings.shared.darkTheme == true {
            backgroundImage.image = UIImage(named: "screen_black_ipad.jpg")
        } else {
            backgroundImage.image = UIImage(named: "screen_ipad.jpg")
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Previous game was saved", message: "Do you want to download the game?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            guard let chessboardViewController = ChessboardViewController.getInstanceViewController else { return }
            self.navigationController?.pushViewController(chessboardViewController, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { action in
            Settings.shared.saveGame = false
            
            guard let vc = ChessboardViewController.getInstanceViewController as? ChessboardViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func isGameWillSaved() {
        if Settings.shared.saveGame {
            showAlert()
        } else {
            guard let vc = ChessboardViewController.getInstanceViewController as? ChessboardViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func showAbout(){
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseIn]) {
            self.logoImage.alpha = 0.0
            self.blurEffect.alpha = 1.0
            self.rulesView.alpha = 1.0
            self.closeButtonView.alpha = 1.0
        }
    }
    
    private func hideAbout(){
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseOut]) {
            self.logoImage.alpha = 1.0
            self.blurEffect.alpha = 0.0
            self.rulesView.alpha = 0.0
            self.closeButtonView.alpha = 0.0
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        isGameWillSaved()
    }
    @IBAction func scoreButtonPushed(_ sender: Any) {
        
    }
    @IBAction func settingsButtonPushed(_ sender: Any) {
        guard let vc = SettingsViewController.getInstanceViewController as? SettingsViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func aboutButtonPushed(_ sender: Any) {
        showAbout()
    }
    @IBAction func closeAbout(_ sender: Any) {
        hideAbout()
    }
}
