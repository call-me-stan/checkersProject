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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSwitcherIsOn()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func isSwitcherIsOn() {
        if Settings.shared.darkTheme == true {
            switcher.isOn = false
            currentThemeLabel.text = "dark"
            themImageView.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            currentThemeLabel.textColor = #colorLiteral(red: 0.7328173518, green: 0.7689656019, blue: 0.9408709407, alpha: 1)
            themeLabel.textColor = .white
        } else {
            switcher.isOn = true
            currentThemeLabel.text = "light"
            themImageView.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            currentThemeLabel.textColor = .lightGray
            themeLabel.textColor = .black
        }
    }
    
    private func swhitchGameTheme() {
        if switcher.isOn {
            currentThemeLabel.text = "light"
            Settings.shared.darkTheme = false
            delegate?.userSwitchTheme()
            print(Settings.shared.darkTheme)
        } else {
            currentThemeLabel.text = "dark"
            Settings.shared.darkTheme = true
            delegate?.userSwitchTheme()
            print(Settings.shared.darkTheme)
        }
    }
    
    @IBAction func switchTheme(_ sender: Any) {
        swhitchGameTheme()
        isSwitcherIsOn()
    }
    
}
