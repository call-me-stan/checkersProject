//
//  ThemeTableViewCell.swift
//  Kinopoisk
//
//  Created by Андрей Трофимов on 28.02.22.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {
    @IBOutlet weak var currentThemeLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSwitcherIsOn()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func isSwitcherIsOn() {
        if Settings.shared.theme == .light {
            switcher.isOn = true
        } else {
            switcher.isOn = false
            currentThemeLabel.text = "dark"
        }
    }
    
    private func swhitchGameTheme() {
        if switcher.isOn {
            currentThemeLabel.text = "light"
            Settings.shared.theme = .light
            print(Settings.shared.theme)
        } else {
            currentThemeLabel.text = "dark"
            Settings.shared.theme = .dark
            print(Settings.shared.theme)
        }
    }
    
    @IBAction func switchTheme(_ sender: Any) {
        swhitchGameTheme()
    }
    
}
