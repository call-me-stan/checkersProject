//
//  AboutView.swift
//  Checkers
//
//  Created by Станислав Гусев on 18.06.2022.
//

import UIKit

class AboutView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var gamePiecesAndBoardHeader: UILabel!
    @IBOutlet weak var gamePiecesAndBoardLabel: UILabel!
    @IBOutlet weak var takingTurnHeader: UILabel!
    @IBOutlet weak var takingTurnLabel: UILabel!
    @IBOutlet weak var kingPiecesHeader: UILabel!
    @IBOutlet weak var kingPiecesLabel: UILabel!
    @IBOutlet weak var winningTheGameHeader: UILabel!
    @IBOutlet weak var winningTheGameLabel: UILabel!
    
    @IBInspectable override var cornerRadius: CGFloat {
        set { contentView.layer.cornerRadius = newValue }
        get { contentView.layer.cornerRadius }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLocalization()
        currentTheme()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        Bundle(for: AboutView.self).loadNibNamed("AboutView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    private func setLocalization() {
        gamePiecesAndBoardHeader.text = "gamePiecesAndBoardHeader_text".localized
        gamePiecesAndBoardLabel.text = "gamePiecesAndBoardLabel_text".localized
        takingTurnHeader.text = "takingTurnHeader_text".localized
        takingTurnLabel.text = "takingTurnLabel_text".localized
        kingPiecesHeader.text = "kingPiecesHeader_text".localized
        kingPiecesLabel.text = "kingPiecesLabel_text".localized
        winningTheGameHeader.text = "winningTheGameHeader_text".localized
        winningTheGameLabel.text = "You win the game when the opponent has no more pieces or can't move (even if he/she still has pieces). If neither player can move then it is a draw or a tie."
    }
    
    private func currentTheme() {
        if Settings.shared.darkTheme == true {
            contentView.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            gamePiecesAndBoardLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            takingTurnLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            kingPiecesLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            winningTheGameLabel.textColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        } else {
            contentView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            gamePiecesAndBoardLabel.textColor = .black
            takingTurnLabel.textColor = .black
            kingPiecesLabel.textColor = .black
            winningTheGameLabel.textColor = .black
        }
    }
}
