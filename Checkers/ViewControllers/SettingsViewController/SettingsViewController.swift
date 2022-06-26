//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Станислав Гусев on 19.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrowView: UIView!
    @IBOutlet weak var arrowImageView: UIImageView!
    private var animation: CABasicAnimation?
    
    @IBOutlet public var mainView: UIView!
    @IBOutlet weak var settingsLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setAnimation()
        currentTheme()
        setLocalization()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ThemeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ThemeTableViewCell")
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "LanguageTableViewCell")
    }
    
    private func currentTheme() {
        if Settings.shared.darkTheme == true {
            self.view.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            arrowImageView.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            arrowImageView.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
        }
    }
    
    
    
    func setLocalization(){
        settingsLable.text = "settings_text".localized
    }
    
    private func setAnimation() {
        animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation?.toValue = view.frame.origin.x - arrowView.frame.origin.x + arrowView.frame.size.width + 8.0
        animation?.autoreverses = true
        animation?.repeatCount = .infinity
        animation?.fillMode = .both
        animation?.duration = 1.0
        animation?.beginTime = CACurrentMediaTime()
        animation?.timingFunction = .easeOut
        animation?.isRemovedOnCompletion = false
        
        if let animation = animation {
            arrowView.layer.add(animation, forKey: animation.description)
        }
    }
    @IBAction func backToMenu(_ sender: Any) {
        guard let vc = MenuViewController.getInstanceViewController as? MenuViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeTableViewCell") as? ThemeTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.selectionStyle = .none
            cell.isSwitcherIsOn()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell") as? LanguageTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.selectionStyle = .none
            cell.currentTheme()
            return cell
        default: return UITableViewCell()
        }
    }
}

extension SettingsViewController: ThemeTableViewCellDelegate {
    func userSwitchTheme() {
        currentTheme()
        tableView.reloadData()
    }
}

extension SettingsViewController: LanguageTableViewCellDelegate {
    func userSwitchLanguage() {
        setLocalization()
        tableView.reloadData()
    }
}


