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
        setupText()
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
    
    private func setupText() {
        gamePiecesAndBoardHeader.text = "Game Pieces and Board"
        gamePiecesAndBoardLabel.text = "Checkers is a board game played between two people on an 8x8 checked board.\n\nEach player has 12 pieces that are like flat round disks that fit inside each of the boxes on the board. The pieces are placed on every other dark square and then staggered by rows, like shown on the board.\n\nEach Checkers player has different colored pieces."
        takingTurnHeader.text = "Taking a Turn"
        takingTurnLabel.text = "Typically the light color pieces moves first. Each player takes their turn by moving a piece. Pieces are always moved diagonally and can be moved in the following ways:\n\n\u{2022} Diagonally in the forward direction (towards the opponent) to the next dark square.\n\n\u{2022} If there is one of the opponent's pieces next to a piece and an empty space on the other side, you jump your opponent and remove their piece. You can do multiple jumps if they are lined up in the forward direction. \n*** note: if you have a jump, you have no choice but to take it."
        kingPiecesHeader.text = "King Pieces"
        kingPiecesLabel.text = "The last row is called the king row. If you get a piece across the board to the opponent's king row, that piece becomes a king. Another piece is placed onto that piece so it is now two pieces high. King pieces can move in both directions, forward and backward.\n\nOnce a piece is kinged, the player must wait until the next turn to jump out of the king row."
        winningTheGameHeader.text = "Winning the Game"
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
