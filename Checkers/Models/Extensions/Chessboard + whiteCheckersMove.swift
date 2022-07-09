//
//  Chessboard + whiteCheckersMove.swift
//  Checkers
//
//  Created by Станислав Гусев on 02.07.2022.
//

import UIKit

extension Chessboard {
    func canStepCheckerWhite(sender: UIPanGestureRecognizer) {
        arrayPossibleStepsWhite.removeAll()
        guard let checker = sender.view, let checkerCell = checker.superview, let board = checkerCell.superview else {return}
        for cell in board.subviews {
            if cell.subviews.first?.tag == 0 || cell.subviews.first?.tag == 2 {
                let filterSevenTop = board.subviews.filter({$0.tag == cell.tag + 7})
                let filterNineTop = board.subviews.filter({$0.tag == cell.tag + 9})
                let filterFourteenTop = board.subviews.filter({$0.tag == cell.tag + 14})
                let filterEighteenTop = board.subviews.filter({$0.tag == cell.tag + 18})
                let filterSevenBottom = board.subviews.filter({$0.tag == cell.tag - 7})
                let filterNineBottom = board.subviews.filter({$0.tag == cell.tag - 9})
                let filterFourteenBottom = board.subviews.filter({$0.tag == cell.tag - 14})
                let filterEighteenBottom = board.subviews.filter({$0.tag == cell.tag - 18})
                if  ((filterSevenTop.first?.subviews.first?.tag == 1 || filterSevenTop.first?.subviews.first?.tag == 3) &&
                     filterFourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     filterFourteenTop.first?.backgroundColor == .black)
                        ||
                        ((filterNineTop.first?.subviews.first?.tag == 1 || filterNineTop.first?.subviews.first?.tag == 3) &&
                         filterEighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                         filterEighteenTop.first?.backgroundColor == .black)
                        ||
                        ((filterSevenBottom.first?.subviews.first?.tag == 1 || filterSevenBottom.first?.subviews.first?.tag == 3) &&
                         filterFourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                         filterFourteenBottom.first?.backgroundColor == .black)
                        ||
                        ((filterNineBottom.first?.subviews.first?.tag == 1 || filterNineBottom.first?.subviews.first?.tag == 3) &&
                         filterEighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                         filterEighteenBottom.first?.backgroundColor == .black) {
                    arrayPossibleStepsWhite.append(cell.tag)
                    print("white\(arrayPossibleStepsWhite)")
                }
            }
        }
    }
    
    func canStepQueenWhite(sender: UIPanGestureRecognizer) {
        arrayPossibleStepsQueenWhite.removeAll()
        guard let checker = sender.view, let checkerCell = checker.superview, let board = checkerCell.superview else {return}
        for cell in board.subviews {
            if cell.subviews.first?.tag == 2 {
                let sevenTop = board.subviews.filter{($0.tag == cell.tag + 7)}
                let nineTop = board.subviews.filter{($0.tag == cell.tag + 9)}
                let fourteenTop = board.subviews.filter{($0.tag == cell.tag + 14)}
                let eighteenTop = board.subviews.filter{($0.tag == cell.tag + 18)}
                let sevenBottom = board.subviews.filter{($0.tag == cell.tag - 7)}
                let nineBottom = board.subviews.filter{($0.tag == cell.tag - 9)}
                let fourteenBottom = board.subviews.filter{($0.tag == cell.tag - 14)}
                let eighteenBottom = board.subviews.filter{($0.tag == cell.tag - 18)}
                let twentyOneTop = board.subviews.filter{($0.tag == cell.tag + 21)}
                let twentyEightTop = board.subviews.filter{($0.tag == cell.tag + 28)}
                let thirtyFiveTop = board.subviews.filter{($0.tag == cell.tag + 35)}
                let twentySevenTop = board.subviews.filter{($0.tag == cell.tag + 27)}
                let thirtySixTop = board.subviews.filter{($0.tag == cell.tag + 36)}
                let fortyFiveTop = board.subviews.filter{($0.tag == cell.tag + 45)}
                let twentyOneBottom = board.subviews.filter{($0.tag == cell.tag - 21)}
                let twentyEightBottom = board.subviews.filter{($0.tag == cell.tag - 28)}
                let thirtyFiveBottom = board.subviews.filter{($0.tag == cell.tag - 35)}
                let twentySevenBottom = board.subviews.filter{($0.tag == cell.tag - 27)}
                let thirtySixBottom = board.subviews.filter{($0.tag == cell.tag - 36)}
                let fortyFiveBottom = board.subviews.filter{($0.tag == cell.tag - 45)}
                
                //MARK: - (+ 14)
                if ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) &&
                    fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                    (twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil || twentyOneTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                    (twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil || twentyEightTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                    (thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                    fourteenTop.first?.backgroundColor == .black) ||
                    
                    ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) &&
                     sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     (twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil || twentyEightTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentyOneTop.first?.backgroundColor == .black) ||
                    
                    ((twentyOneTop.first?.subviews.first?.tag == 1 || twentyOneTop.first?.subviews.first?.tag == 3) &&
                     sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     (thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentyEightTop.first?.backgroundColor == .black) ||
                    
                    ((twentyEightTop.first?.subviews.first?.tag == 1 || twentyEightTop.first?.subviews.first?.tag == 3) &&
                     sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtyFiveTop.first?.backgroundColor == .black) ||
                    //MARK: - (+ 18)
                    ((nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3) &&
                     eighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     (twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil || twentySevenTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil || thirtySixTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     eighteenTop.first?.backgroundColor == .black) ||
                    
                    ((eighteenTop.first?.subviews.first?.tag == 1 || eighteenTop.first?.subviews.first?.tag == 3) &&
                     nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     (thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil || thirtySixTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentySevenTop.first?.backgroundColor == .black) ||
                    
                    ((twentySevenTop.first?.subviews.first?.tag == 1 || twentySevenTop.first?.subviews.first?.tag == 3) &&
                     nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     eighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     (fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveTop.first(where: {$0.subviews.isEmpty}) == nil) &&
                     thirtySixTop.first?.backgroundColor == .black) ||
                    
                    ((thirtySixTop.first?.subviews.first?.tag == 1 || thirtySixTop.first?.subviews.first?.tag == 3) &&
                     nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     eighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil &&
                     fortyFiveTop.first?.backgroundColor == .black) ||
                    //MARK: - (- 14)
                    ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) &&
                     fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil || twentyOneBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil || twentyEightBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     fourteenBottom.first?.backgroundColor == .black) ||
                    
                    ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) &&
                     sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil || twentyEightBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentyOneBottom.first?.backgroundColor == .black) ||
                    
                    ((twentyOneBottom.first?.subviews.first?.tag == 1 || twentyOneBottom.first?.subviews.first?.tag == 3) &&
                     sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentyEightBottom.first?.backgroundColor == .black) ||
                    
                    ((twentyEightBottom.first?.subviews.first?.tag == 1 || twentyEightBottom.first?.subviews.first?.tag == 3) &&
                     sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtyFiveBottom.first?.backgroundColor == .black) ||
                    //MARK: - (- 18)
                    ((nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3) &&
                     eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil || twentySevenBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil || thirtySixBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     eighteenBottom.first?.backgroundColor == .black) ||
                    
                    ((eighteenBottom.first?.subviews.first?.tag == 1 || eighteenBottom.first?.subviews.first?.tag == 3) &&
                     nineBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil || thirtySixBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     (fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     twentySevenBottom.first?.backgroundColor == .black) ||
                    
                    ((twentySevenBottom.first?.subviews.first?.tag == 1 || twentySevenBottom.first?.subviews.first?.tag == 3) &&
                     nineBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     (fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil || fortyFiveBottom.first(where: {$0.subviews.isEmpty}) == nil) &&
                     thirtySixBottom.first?.backgroundColor == .black) ||
                    
                    ((thirtySixBottom.first?.subviews.first?.tag == 1 || thirtySixBottom.first?.subviews.first?.tag == 3) &&
                     nineBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                     fortyFiveBottom.first?.backgroundColor == .black) {
                    self.arrayPossibleStepsQueenWhite.append(cell.tag)
                    print("queenWhite: \(arrayPossibleStepsQueenWhite)")
                }
            }
        }
    }
}
