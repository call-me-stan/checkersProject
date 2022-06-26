//
//  ThemeTableViewCell.swift
//  Kinopoisk
//
//  Created by Андрей Трофимов on 28.02.22.
//

import UIKit

protocol ThemeTableViewCellDelegate: AnyObject {
    func userSwitchTheme()
}

class ThemeTableViewCell: UITableViewCell {
    @IBOutlet weak var currentThemeLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themImageView: UIImageView!
    weak var delegate: ThemeTableViewCellDelegate?
    weak var languageTableViewCell: LanguageTableViewCell?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        isSwitcherIsOn()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func isSwitcherIsOn() {
        if Settings.shared.darkTheme == true {
            switcher.isOn = false
            currentThemeLabel.text = "currentThemeLabel_dark_text".localized
            themImageView.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            currentThemeLabel.textColor = #colorLiteral(red: 0.7328173518, green: 0.7689656019, blue: 0.9408709407, alpha: 1)
            themeLabel.text = "themeLable_text".localized
            themeLabel.textColor = .white
        } else {
            switcher.isOn = true
            currentThemeLabel.text = "currentThemeLabel_light_text".localized
            themImageView.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            currentThemeLabel.textColor = .lightGray
            themeLabel.text = "themeLable_text".localized
            themeLabel.textColor = .black
        }
    }
    
    private func swhitchGameTheme() {
        if switcher.isOn {
            Settings.shared.darkTheme = false
            isSwitcherIsOn()
            delegate?.userSwitchTheme()
            languageTableViewCell?.languageLabel.textColor = .white
            print(Settings.shared.darkTheme)
        } else {
            Settings.shared.darkTheme = true
            isSwitcherIsOn()
            delegate?.userSwitchTheme()
            languageTableViewCell?.languageLabel.textColor = .black
            print(Settings.shared.darkTheme)
        }
    }
    
    @IBAction func switchTheme(_ sender: Any) {
        swhitchGameTheme()
    }
}
