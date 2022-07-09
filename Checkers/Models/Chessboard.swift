//
//  Chessboard.swift
//  Checkers
//
//  Created by Станислав Гусев on 09.04.2022.

import UIKit

enum CheckerColor: String {
    case blackChecker, whiteChecker, blackCheckerKing, whiteCheckerKing
}

enum PlayersMove: Int {
    case whitesMove
    case blacksMove
}

class Chessboard: NSObject {
    
    private let currentLineForChecker: [Int] = [0,1,2,5,6,7]
    var checkers: [Checker] = []
    var currentPlayer: PlayersMove = .whitesMove
    var saveCurrentMove: PlayersMove?
    
    var whiteMustBeat: Int = 0
    var blackMustBeat: Int = 0
    
    var arrayBorder: [UIView] = []
    var arrayPossibleStepsWhite = [Int]()
    var arrayPossibleStepsBlack = [Int]()
    var arrayPossibleStepsQueenWhite = [Int]()
    var arrayPossibleStepsQueenBlack = [Int]()
    
    //MARK: Create chessboard
    func createBoard(with chessboard: UIView) {
        var cellSize: CGSize {
            return CGSize(width: chessboard.frame.size.width / 8.0, height: chessboard.frame.size.height / 8.0)
        }
        var checkerFrame: CGRect {
            return CGRect(x: .zero, y: .zero, width: cellSize.width * 0.8, height: cellSize.height * 0.8)
        }
        var currentNumberCell: Int = 0
        
        for y in 0..<8 {
            for x in 0..<8 {
                let cell = UIView(
                    frame: CGRect(origin: CGPoint(
                        x: CGFloat(x) * cellSize.width,
                        y: CGFloat(y) * cellSize.height),
                                  size: cellSize))
                
                chessboard.addSubview(cell)
                cell.tag = currentNumberCell
                currentNumberCell += 1
                
                if (x + y) % 2 == 0 {
                    cell.backgroundColor = .white
                } else {
                    cell.backgroundColor = .black
                    
                    let checkerColor: CheckerColor = (x + y) % 2 == 0 ? .whiteChecker : .blackChecker
                    guard checkerColor == .blackChecker, currentLineForChecker.contains(y) else { continue }
                    
                    let checker = createChecker(checkerColor: y < 3 ? .blackChecker : .whiteChecker)
                    
                    cell.addSubview(checker)
                    checker.frame = checkerFrame
                    checker.center = 
                }
            }
        }
    }
    
    func createChecker(checkerColor: CheckerColor) -> UIImageView {
        let checker = UIImageView(image: UIImage(named: checkerColor.rawValue))
        checker.isUserInteractionEnabled = true
        switch checkerColor {
        case .blackChecker:
            checker.tag = 1
        case .whiteChecker:
            checker.tag = 0
        case .blackCheckerKing:
            checker.tag = 3
        case .whiteCheckerKing:
            checker.tag = 2
        }
        checker.contentMode = .scaleToFill
        createGestureRecognizer().forEach { checker.addGestureRecognizer($0) }
        
        return checker
    }
    
    //MARK: Save chessboard
    func saveGame(with chessboard: UIView) {
        //        Settings.shared.saveGame = true
        //
        //        for cell in chessboard.subviews {
        //            if !cell.subviews.isEmpty {
        //                self.checkers.append(Checker(checkerNumberCell: (cell as? SquareView)?.numberCell ?? -1,
        //                                             checkerImage: (cell.subviews.first as? CheckerImageView)?.nameImage ?? "",
        //                                             size: cell.subviews.first?.bounds.size ?? .zero))
        //            }
        //        }
        //
        //        self.checkers.forEach({
        //            print($0.checkerNumberCell)
        //        })
        //
        //        if let data = try? NSKeyedArchiver.archivedData(withRootObject: self.checkers, requiringSecureCoding: true) {
        //            UserDefaults.standard.set(data, forKey: "Checkers")
        //        }
    }
    
    //MARK: Reset chessboard
    func resetGame(with chessboard: UIView) {
        UserDefaults.standard.removeObject(forKey: "Checkers")
        UserDefaults.standard.removeObject(forKey: "count")
        for square in chessboard.subviews {
            square.subviews.first?.removeFromSuperview()
            chessboard.subviews.first?.removeFromSuperview()
        }
        createBoard(with: chessboard)
        Settings.shared.saveGame = false
    }
    
    //MARK: Load chessboard
    func loadBoard(with chessboard: UIView) {
        //        for square in chessboard.subviews {
        //            square.subviews.first?.removeFromSuperview()
        //        }
        //
        //        if let data = UserDefaults.standard.object(forKey: "Checkers") as? Data {
        //            if let checkers = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Checker]{
        //                self.checkers = checkers
        //            }
        //        }
        //
        //        for (index, square) in chessboard.subviews.enumerated() {
        //            if let checker = self.checkers.first(where: { $0.checkerNumberCell == index}) {
        //                if square.subviews.isEmpty {
        //                    let checkerImage = CheckerImage(rawValue: checker.checkerImage) ?? .whiteChecker
        //                    let addChecker = checker.createChecker(checkerImage: checkerImage, size: checker.size)
        //                    square.addSubview(addChecker)
        //                    addChecker.center = CGPoint(x: square.bounds.width / 2.0,
        //                                                y: square.bounds.height / 2.0)
        //                    createGestureRecognizer().forEach { addChecker.addGestureRecognizer($0) }
        //                }
        //            }
        //        }
    }
    
    //    MARK: createGesture
    
    private func createGestureRecognizer() -> [UIGestureRecognizer] {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(_:)))
        longPressGesture.minimumPressDuration = 0.1
        longPressGesture.delegate = self
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_:)))
        panGestureRecognizer.delegate = self
        
        return [longPressGesture, panGestureRecognizer]
    }
    
    //    MARK: longGesture
    
    @objc private func longPressGesture(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case.began:
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                sender.view?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        case.ended:
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
                sender.view?.transform = .identity
            }
        default: break
        }
    }
    
    //    MARK: panGesture
    
    @objc private func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        guard let checker = sender.view, let checkerCell = checker.superview, let board = checkerCell.superview else { return }
        let filterSevenTop = board.subviews.filter{($0.tag == checkerCell.tag + 7)}
        let filterNineTop = board.subviews.filter{($0.tag == checkerCell.tag + 9)}
        let filterSevenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 7)}
        let filterNineBottom = board.subviews.filter{($0.tag == checkerCell.tag - 9)}
        
        switch sender.state {
        case.began:
            board.bringSubviewToFront(checkerCell)
        case.changed:
            let translation = sender.translation(in: board)
            checker.center = CGPoint(x: checker.center.x + translation.x, y: checker.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: board)
            
        case.ended:
            // MARK: whites move
            kingsMoves(sender: sender)
            for cell in board.subviews {
                let checkerFrame = CGRect(x: .zero, y: .zero, width: cell.frame.width * 8.0, height: cell.frame.height * 8.0)
                
                if cell.frame.contains(sender.location(in: board)) {
                    if arrayPossibleStepsWhite.contains(checkerCell.tag) ||
                        arrayPossibleStepsQueenWhite.contains(checkerCell.tag),
                       checker.tag == 0, currentPlayer == .whitesMove, cell.tag == (checkerCell.tag - 14) {
                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                           (filterSevenBottom.first(where: {$0.subviews.isEmpty}) == nil),
                           (filterSevenBottom.first?.subviews.first?.tag == 1 || filterSevenBottom.first?.subviews.first?.tag == 3) {
                            print("белая побила вправо")
                            filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                            board.bringSubviewToFront(cell)
                            blackMustBeat += 1
                            gameOver()
                            if cell.tag < 8, checker.tag == 0 {
                                checker.removeFromSuperview()
                                let checker = createChecker(checkerColor: .whiteCheckerKing)
                                cell.addSubview(checker)
                                checker.frame = checkerFrame
                            } else {
                                cell.addSubview(checker)
                                checker.frame.origin = .zero
                            }
                            checkBeatCheckerWhite(sender: sender)
                            checkingStepsAllCheckers(sender: sender)
                        }
                        
                    } else {
                        if arrayPossibleStepsWhite.contains(checkerCell.tag) ||
                            arrayPossibleStepsQueenWhite.contains(checkerCell.tag),
                           checker.tag == 0, currentPlayer == .whitesMove, cell.tag == (checkerCell.tag - 18) {
                            if cell.subviews.isEmpty, cell.backgroundColor == UIColor(named: "ColorBlack"),
                               (filterNineBottom.first(where: {$0.subviews.isEmpty}) == nil),
                               (filterNineBottom.first?.subviews.first?.tag == 1 || filterNineBottom.first?.subviews.first?.tag == 3) {
                                print("белая побила влево")
                                filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                board.bringSubviewToFront(cell)
                                blackMustBeat += 1
                                gameOver()
                                if cell.tag < 8, checker.tag == 0 {
                                    checker.removeFromSuperview()
                                    let checker = createChecker(checkerColor: .whiteCheckerKing)
                                    cell.addSubview(checker)
                                    checker.frame = checkerFrame
                                } else {
                                    cell.addSubview(checker)
                                    checker.frame.origin = .zero
                                }
                                checkBeatCheckerWhite(sender: sender)
                                checkingStepsAllCheckers(sender: sender)
                            }
                        } else {
                            if arrayPossibleStepsWhite.isEmpty, arrayPossibleStepsQueenWhite.isEmpty,
                               checker.tag == 0, currentPlayer == .whitesMove,
                               (cell.tag == (checkerCell.tag - 7) || cell.tag == (checkerCell.tag - 9)) {
                                if cell.subviews.isEmpty, cell.backgroundColor == .black {
                                    print("белая походила")
                                    board.bringSubviewToFront(cell)
                                    if cell.tag < 8 {
                                        checker.removeFromSuperview()
                                        let checker = createChecker(checkerColor: .whiteCheckerKing)
                                        cell.addSubview(checker)
                                        checker.frame = checkerFrame
                                    } else {
                                        cell.addSubview(checker)
                                        checker.frame.origin = .zero
                                    }
                                    arrayBorder.forEach({ $0.backgroundColor = .black } )
                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                    checkingStepsAllCheckers(sender: sender)
                                }
                                
                                //MARK: - MOVE WHITE BACK
                            } else {
                                if arrayPossibleStepsWhite.contains(checkerCell.tag) ||
                                    arrayPossibleStepsQueenWhite.contains(checkerCell.tag),
                                   checker.tag == 0, currentPlayer == .whitesMove,
                                   (cell.tag == (checkerCell.tag + 14)) {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                       (filterSevenTop.first(where: {$0.subviews.isEmpty}) == nil),
                                       (filterSevenTop.first?.subviews.first?.tag == 1 || filterSevenTop.first?.subviews.first?.tag == 3) {
                                        print("белая побила назад влево")
                                        filterSevenTop.first?.subviews.first?.removeFromSuperview()
                                        board.bringSubviewToFront(cell)
                                        blackMustBeat += 1
                                        gameOver()
                                        if cell.tag < 8, checker.tag == 0 {
                                            checker.removeFromSuperview()
                                            let checker = createChecker(checkerColor: .whiteCheckerKing)
                                            cell.addSubview(checker)
                                            checker.frame = checkerFrame
                                        } else {
                                            cell.addSubview(checker)
                                            checker.frame.origin = .zero
                                        }
                                        checkBeatCheckerWhite(sender: sender)
                                        checkingStepsAllCheckers(sender: sender)
                                    }
                                } else {
                                    if arrayPossibleStepsWhite.contains(checkerCell.tag) ||
                                        arrayPossibleStepsQueenWhite.contains(checkerCell.tag),
                                       checker.tag == 0, currentPlayer == .whitesMove,
                                       (cell.tag == (checkerCell.tag + 18)) {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                           (filterNineTop.first(where: {$0.subviews.isEmpty}) == nil),
                                           (filterNineTop.first?.subviews.first?.tag == 1 || filterNineTop.first?.subviews.first?.tag == 3) {
                                            print("белая побила назад вправо")
                                            filterNineTop.first?.subviews.first?.removeFromSuperview()
                                            board.bringSubviewToFront(cell)
                                            blackMustBeat += 1
                                            gameOver()
                                            if cell.tag < 8, checker.tag == 0 {
                                                checker.removeFromSuperview()
                                                let checker = createChecker(checkerColor: .whiteCheckerKing)
                                                cell.addSubview(checker)
                                                checker.frame = checkerFrame
                                            } else {
                                                cell.addSubview(checker)
                                                checker.frame.origin = .zero
                                            }
                                            checkBeatCheckerWhite(sender: sender)
                                            checkingStepsAllCheckers(sender: sender)
                                        }
                                        
                                        //MARK: - MOVE BLACK FORWARD
                                    } else {
                                        if arrayPossibleStepsBlack.contains(checkerCell.tag) ||
                                            arrayPossibleStepsQueenBlack.contains(checkerCell.tag),
                                           checker.tag == 1, currentPlayer == .blacksMove,
                                           (cell.tag == (checkerCell.tag + 14)) {
                                            if cell.subviews.isEmpty, cell.backgroundColor == UIColor(named: "ColorBlack"),
                                               (filterSevenTop.first(where: { $0.subviews.isEmpty}) == nil),
                                               (filterSevenTop.first?.subviews.first?.tag == 0 || filterSevenTop.first?.subviews.first?.tag == 2) {
                                                print("черная побила влево")
                                                filterSevenTop.first?.subviews.first?.removeFromSuperview()
                                                board.bringSubviewToFront(cell)
                                                whiteMustBeat += 1
                                                gameOver()
                                                if cell.tag > 55, checker.tag == 1 {
                                                    checker.removeFromSuperview()
                                                    let checker = createChecker(checkerColor: .blackCheckerKing)
                                                    cell.addSubview(checker)
                                                    checker.frame = checkerFrame
                                                } else {
                                                    cell.addSubview(checker)
                                                    checker.frame.origin = .zero
                                                }
                                                checkBeatCheckerBlack(sender: sender)
                                                checkingStepsAllCheckers(sender: sender)
                                            }
                                        } else {
                                            if arrayPossibleStepsBlack.contains(checkerCell.tag) ||
                                                arrayPossibleStepsQueenBlack.contains(checkerCell.tag),
                                               checker.tag == 1, currentPlayer == .blacksMove,
                                               (cell.tag == (checkerCell.tag + 18)) {
                                                if cell.subviews.isEmpty, cell.backgroundColor == UIColor(named: "ColorBlack"),
                                                   (filterNineTop.first(where: { $0.subviews.isEmpty}) == nil),
                                                   (filterNineTop.first?.subviews.first?.tag == 0 || filterNineTop.first?.subviews.first?.tag == 2)  {
                                                    print("черная побила вправо")
                                                    filterNineTop.first?.subviews.first?.removeFromSuperview()
                                                    board.bringSubviewToFront(cell)
                                                    whiteMustBeat += 1
                                                    gameOver()
                                                    if cell.tag > 55, checker.tag == 1 {
                                                        checker.removeFromSuperview()
                                                        let checker = createChecker(checkerColor: .blackCheckerKing)
                                                        cell.addSubview(checker)
                                                        checker.frame = checkerFrame
                                                    } else {
                                                        cell.addSubview(checker)
                                                        checker.frame.origin = .zero
                                                    }
                                                    checkBeatCheckerBlack(sender: sender)
                                                    checkingStepsAllCheckers(sender: sender)
                                                }
                                            } else {
                                                if  arrayPossibleStepsBlack.isEmpty, arrayPossibleStepsQueenBlack.isEmpty,
                                                    checker.tag == 1, currentPlayer == .blacksMove,
                                                    (cell.tag == (checkerCell.tag + 7) || cell.tag == (checkerCell.tag + 9)) {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black {
                                                        print("черная походила")
                                                        board.bringSubviewToFront(cell)
                                                        if cell.tag > 55 {
                                                            checker.removeFromSuperview()
                                                            let checker = createChecker(checkerColor: .blackCheckerKing)
                                                            cell.addSubview(checker)
                                                            checker.frame = checkerFrame
                                                        } else {
                                                            cell.addSubview(checker)
                                                            checker.frame.origin = .zero
                                                        }
                                                        arrayBorder.forEach({ $0.backgroundColor = .black } )
                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                        checkingStepsAllCheckers(sender: sender)
                                                    }
                                                } else {
                                                    //MARK: - MOVE BLACK BACK
                                                    if arrayPossibleStepsBlack.contains(checkerCell.tag) ||
                                                        arrayPossibleStepsQueenBlack.contains(checkerCell.tag),
                                                       checker.tag == 1, currentPlayer == .blacksMove,
                                                       (cell.tag == (checkerCell.tag - 14)) {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                           (filterSevenBottom.first(where: {$0.subviews.isEmpty}) == nil),
                                                           (filterSevenBottom.first?.subviews.first?.tag == 0 || filterSevenBottom.first?.subviews.first?.tag == 2) {
                                                            print("черная побила назад влево")
                                                            filterSevenBottom.first?.subviews.first?.removeFromSuperview()
                                                            board.bringSubviewToFront(cell)
                                                            whiteMustBeat += 1
                                                            gameOver()
                                                            if cell.tag > 55, checker.tag == 1 {
                                                                checker.removeFromSuperview()
                                                                let checker = createChecker(checkerColor: .blackCheckerKing)
                                                                cell.addSubview(checker)
                                                                checker.frame = checkerFrame
                                                            } else {
                                                                cell.addSubview(checker)
                                                                checker.frame.origin = .zero
                                                            }
                                                            checkBeatCheckerBlack(sender: sender)
                                                            checkingStepsAllCheckers(sender: sender)
                                                        }
                                                    } else {
                                                        if arrayPossibleStepsBlack.contains(checkerCell.tag) ||
                                                            arrayPossibleStepsQueenBlack.contains(checkerCell.tag),
                                                           checker.tag == 1, currentPlayer == .blacksMove,
                                                           (cell.tag == (checkerCell.tag - 18)) {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               (filterNineBottom.first(where: {$0.subviews.isEmpty}) == nil),
                                                               (filterNineBottom.first?.subviews.first?.tag == 0 || filterNineBottom.first?.subviews.first?.tag == 2) {
                                                                print("черная побила назад вправо")
                                                                filterNineBottom.first?.subviews.first?.removeFromSuperview()
                                                                board.bringSubviewToFront(cell)
                                                                whiteMustBeat += 1
                                                                gameOver()
                                                                if cell.tag > 55, checker.tag == 1 {
                                                                    checker.removeFromSuperview()
                                                                    let checker = createChecker(checkerColor: .blackCheckerKing)
                                                                    cell.addSubview(checker)
                                                                    checker.frame = checkerFrame
                                                                } else {
                                                                    cell.addSubview(checker)
                                                                    checker.frame.origin = .zero
                                                                }
                                                                checkBeatCheckerBlack(sender: sender)
                                                                checkingStepsAllCheckers(sender: sender)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else {
                    checker.frame.origin = .zero
                }
            }
            
        default: break
        }
        
        //    @objc private func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        //        guard let checker = sender.view, let cell = checker.superview, let board = cell.superview else { return }
        //
        //        switch sender.state {
        //        case.began:
        //            board.bringSubviewToFront(cell)
        //        case.changed:
        //            let translation = sender.translation(in: board)
        //            checker.center = CGPoint(x: checker.center.x + translation.x, y: checker.center.y + translation.y)
        //            sender.setTranslation(.zero, in: board)
        //
        //        case.ended:
        //            var newSquare: UIView?
        //            for view in board.subviews {
        //                if view.frame.contains(sender.location(in: board)), view.subviews.isEmpty, view.tag == 1 {
        //                    newSquare = view
        //                    break
        //                }
        //            }
        //
        //            guard let newSquare = newSquare else {
        //                UIView.animate(withDuration: 0.5, delay: 0,
        //                               usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn)
        //                {
        //                    checker.center = CGPoint(x: cell.bounds.width / 2.0, y: cell.bounds.height / 2)
        //                }
        //                return
        //            }
        //
        //            newSquare.addSubview(checker)
        //
        //            checker.center = CGPoint(x: cell.bounds.width / 2.0, y: cell.bounds.height / 2)
        //            checker.tag = newSquare.hashValue
        //        default: break
        //        }
        //    }
    }
}
    
    extension Chessboard: UIGestureRecognizerDelegate {
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
    }
