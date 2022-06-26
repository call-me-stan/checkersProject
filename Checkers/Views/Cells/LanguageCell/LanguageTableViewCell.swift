//
//  LanguageTableViewCell.swift
//  Checkers
//
//  Created by Станислав Гусев on 25.06.2022.
//

import UIKit

protocol LanguageTableViewCellDelegate: AnyObject {
    func userSwitchLanguage()
}

class LanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var languageImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageSegmentControl: UISegmentedControl!
    weak var delegate: LanguageTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        currentTheme()
        languageSelectedSegmentIndex()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func languageSelectedSegmentIndex() {
        let index = UserDefaults.standard.integer(forKey: "selectedSegmentIndex")
        languageSegmentControl.selectedSegmentIndex = index
        setLocalization()
    }
    
    private func setLocalization(){
        delegate?.userSwitchLanguage()
        languageLabel.text = "language_text".localized
    }
    
    func currentTheme() {
        if Settings.shared.darkTheme == true {
            languageImageView.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            languageLabel.textColor = .white
            languageSegmentControl.selectedSegmentTintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        } else {
            languageImageView.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            languageLabel.textColor = .black
            languageSegmentControl.selectedSegmentTintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
        }
    }
    
    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        Settings.shared.currentLanguageCode = Settings.shared.lanCode[sender.selectedSegmentIndex]

        if sender.selectedSegmentIndex == 0 {
            setLocalization()
        } else {
            setLocalization()
        }
        
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: "selectedSegmentIndex")
    }
}

extension LanguageTableViewCell: ThemeTableViewCellDelegate {
    func userSwitchTheme(){
        
    }
}
