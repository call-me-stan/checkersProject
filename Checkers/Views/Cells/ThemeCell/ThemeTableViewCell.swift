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
        if Settings.shared.darkTheme == true {
            switcher.isOn = false
            currentThemeLabel.text = "dark"
        } else {
            switcher.isOn = true
        }
    }
    
    private func swhitchGameTheme() {
        if switcher.isOn {
            currentThemeLabel.text = "light"
            Settings.shared.darkTheme = false
            print(Settings.shared.darkTheme)
        } else {
            currentThemeLabel.text = "dark"
            Settings.shared.darkTheme = true
            print(Settings.shared.darkTheme)
        }
    }
    
    @IBAction func switchTheme(_ sender: Any) {
        swhitchGameTheme()
    }
    
}
