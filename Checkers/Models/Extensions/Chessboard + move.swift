//
//  Chessboard + move.swift
//  Checkers
//
//  Created by Станислав Гусев on 02.07.2022.
//

import UIKit

extension Chessboard {
    func nextMove(nextMove: PlayersMove, text: String) {
        currentPlayer = nextMove
//        whoMustMoveLabel.text = text.localized
        saveCurrentMove = currentPlayer
    }
    
    func checkingStepsAllCheckers(sender: UIPanGestureRecognizer) {
        canStepQueenBlack(sender: sender)
        canStepQueenWhite(sender: sender)
        canStepCheckerBlack(sender: sender)
        canStepCheckerWhite(sender: sender)
    }
    
    //MARK: - CAN YOU MOVE AGAIN
        func checkBeatCheckerWhite(sender: UIPanGestureRecognizer) {
            arrayBorder.forEach({ $0.backgroundColor = .black } )
            if canYouMove(sender: sender, checkerMove: 0, queenMove: 2, checkerCheck: 1, queenCheck: 3) {
                currentPlayer = .whitesMove
//                whoMustMoveLabel.text = "White's move".localized
                saveCurrentMove = currentPlayer
            } else {
                currentPlayer = .blacksMove
//                whoMustMoveLabel.text = "Black's move".localized
                saveCurrentMove = currentPlayer
            }
        }
        
        func checkBeatCheckerBlack(sender: UIPanGestureRecognizer) {
            arrayBorder.forEach({ $0.backgroundColor = UIColor(named: "ColorBlack") } )
            if canYouMove(sender: sender, checkerMove: 1, queenMove: 3, checkerCheck: 0, queenCheck: 2) {
                currentPlayer = .blacksMove
//                whoMustMoveLabel.text = "Black's move".localized
                saveCurrentMove = currentPlayer
            } else {
                currentPlayer = .whitesMove
//                whoMustMoveLabel.text = "White's move".localized
                saveCurrentMove = currentPlayer
            }
        }
        
        func canYouMove(sender: UIPanGestureRecognizer, checkerMove: Int, queenMove: Int, checkerCheck: Int, queenCheck: Int) -> Bool {
            guard let checker = sender.view, let checkerCell = checker.superview, let board = checkerCell.superview else {return true}
            
            var takeStep: Bool?
            let sevenTop = board.subviews.filter{($0.tag == (checkerCell.tag) + 7)}
            let nineTop = board.subviews.filter{($0.tag == (checkerCell.tag) + 9)}
            let fourteenTop = board.subviews.filter{($0.tag == checkerCell.tag + 14)}
            let eighteenTop = board.subviews.filter{($0.tag == checkerCell.tag + 18)}
            let twentyOneTop = board.subviews.filter{($0.tag == checkerCell.tag + 21)}
            let twentySevenTop = board.subviews.filter{($0.tag == checkerCell.tag + 27)}
            let twentyEightTop = board.subviews.filter{($0.tag == checkerCell.tag + 28)}
            let thirtyFiveTop = board.subviews.filter{($0.tag == checkerCell.tag + 35)}
            let thirtySixTop = board.subviews.filter{($0.tag == checkerCell.tag + 36)}
            let fortyTwoTop = board.subviews.filter{($0.tag == checkerCell.tag + 42)}
            let fortyFiveTop = board.subviews.filter{($0.tag == checkerCell.tag + 45)}
            let sevenBottom = board.subviews.filter{($0.tag == (checkerCell.tag) - 7)}
            let nineBottom = board.subviews.filter{($0.tag == (checkerCell.tag) - 9)}
            let fourteenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 14)}
            let eighteenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 18)}
            let twentyOneBottom = board.subviews.filter{($0.tag == checkerCell.tag - 21)}
            let twentySevenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 27)}
            let twentyEightBottom = board.subviews.filter{($0.tag == checkerCell.tag - 28)}
            let thirtyFiveBottom = board.subviews.filter{($0.tag == checkerCell.tag - 35)}
            let thirtySixBottom = board.subviews.filter{($0.tag == checkerCell.tag - 36)}
            let fortyTwoBottom = board.subviews.filter{($0.tag == checkerCell.tag - 42)}
            let fortyFiveBottom = board.subviews.filter{($0.tag == checkerCell.tag - 45)}
            
            for cell in board.subviews {
                if checker.tag == checkerMove || checker.tag == queenMove, cell.tag == (checkerCell.tag + 14), checkerCell.tag < 48 {
                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                       sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck {
                        takeStep = true
                    }
                } else {
                    if checker.tag == checkerMove || checker.tag == queenMove, cell.tag == (checkerCell.tag + 18), checkerCell.tag < 48 {
                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                           nineTop.first?.subviews.first?.tag == checkerCheck || nineTop.first?.subviews.first?.tag == queenCheck {
                            takeStep = true
                        }
                    } else {
                        if checker.tag == checkerMove || checker.tag == queenMove, cell.tag == (checkerCell.tag - 14), checkerCell.tag > 15 {
                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                               sevenBottom.first?.subviews.first?.tag == checkerCheck ||
                                sevenBottom.first?.subviews.first?.tag == queenCheck {
                                takeStep = true
                            }
                        } else {
                            if checker.tag == checkerMove || checker.tag == queenMove, cell.tag == (checkerCell.tag - 18), checkerCell.tag > 15 {
                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                   nineBottom.first?.subviews.first?.tag == checkerCheck ||
                                    nineBottom.first?.subviews.first?.tag == queenCheck {
                                    takeStep = true
                                }
                            } else {
                                if checker.tag == queenMove, cell.tag == (checkerCell.tag + 27) {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                       ((nineTop.first?.subviews.first?.tag == checkerCheck || nineTop.first?.subviews.first?.tag == queenCheck) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                        ((eighteenTop.first?.subviews.first?.tag == checkerCheck || eighteenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                        takeStep = true
                                    }
                                } else {
                                    if checker.tag == queenMove, cell.tag == (checkerCell.tag + 36) {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                           ((nineTop.first?.subviews.first?.tag == checkerCheck || nineTop.first?.subviews.first?.tag == queenCheck) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                            ((eighteenTop.first?.subviews.first?.tag == checkerCheck || eighteenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                            ((twentySevenTop.first?.subviews.first?.tag == checkerCheck || twentySevenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil)  {
                                            takeStep = true
                                        }
                                    } else {
                                        if checker.tag == queenMove, cell.tag == (checkerCell.tag + 45) {
                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                               ((nineTop.first?.subviews.first?.tag == checkerCheck || nineTop.first?.subviews.first?.tag == queenCheck) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((eighteenTop.first?.subviews.first?.tag == checkerCheck || eighteenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((twentySevenTop.first?.subviews.first?.tag == checkerCheck || twentySevenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((thirtySixTop.first?.subviews.first?.tag == checkerCheck || thirtySixTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil)   {
                                                takeStep = true
                                            }
                                        } else {
                                            if checker.tag == queenMove, cell.tag == (checkerCell.tag + 54) {
                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                   ((nineTop.first?.subviews.first?.tag == checkerCheck || nineTop.first?.subviews.first?.tag == queenCheck) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((eighteenTop.first?.subviews.first?.tag == checkerCheck || eighteenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((twentySevenTop.first?.subviews.first?.tag == checkerCheck || twentySevenTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((thirtySixTop.first?.subviews.first?.tag == checkerCheck || thirtySixTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil  && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((fortyFiveTop.first?.subviews.first?.tag == checkerCheck || fortyFiveTop.first?.subviews.first?.tag == queenCheck) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil)    {
                                                    takeStep = true
                                                }
                                            } else {
                                                if checker.tag == queenMove, cell.tag == (checkerCell.tag + 21) {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                       ((sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((fourteenTop.first?.subviews.first?.tag == checkerCheck || fourteenTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                        takeStep = true
                                                    }
                                                } else {
                                                    if checker.tag == queenMove, cell.tag == (checkerCell.tag + 28) {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                           ((sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((fourteenTop.first?.subviews.first?.tag == checkerCheck || fourteenTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((twentyOneTop.first?.subviews.first?.tag == checkerCheck || twentyOneTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                            takeStep = true
                                                        }
                                                    } else {
                                                        if checker.tag == queenMove, cell.tag == (checkerCell.tag + 35) {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               ((sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((fourteenTop.first?.subviews.first?.tag == checkerCheck || fourteenTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((twentyOneTop.first?.subviews.first?.tag == checkerCheck || twentyOneTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((twentyEightTop.first?.subviews.first?.tag == checkerCheck || twentyEightTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                takeStep = true
                                                            }
                                                        } else {
                                                            if checker.tag == queenMove, cell.tag == (checkerCell.tag + 42) {
                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                   ((sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((fourteenTop.first?.subviews.first?.tag == checkerCheck || fourteenTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyOneTop.first?.subviews.first?.tag == checkerCheck || twentyOneTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyEightTop.first?.subviews.first?.tag == checkerCheck || twentyEightTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((thirtyFiveTop.first?.subviews.first?.tag == checkerCheck || thirtyFiveTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    takeStep = true
                                                                }
                                                            } else {
                                                                if checker.tag == queenMove, cell.tag == (checkerCell.tag + 49) {
                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                       ((sevenTop.first?.subviews.first?.tag == checkerCheck || sevenTop.first?.subviews.first?.tag == queenCheck) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((fourteenTop.first?.subviews.first?.tag == checkerCheck || fourteenTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyOneTop.first?.subviews.first?.tag == checkerCheck || twentyOneTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyEightTop.first?.subviews.first?.tag == checkerCheck || twentyEightTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((thirtyFiveTop.first?.subviews.first?.tag == checkerCheck || thirtyFiveTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((fortyTwoTop.first?.subviews.first?.tag == checkerCheck || fortyTwoTop.first?.subviews.first?.tag == queenCheck) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                        takeStep = true
                                                                    }
                                                                } else {
                                                                    if checker.tag == queenMove, cell.tag == (checkerCell.tag - 27) {
                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                           ((nineBottom.first?.subviews.first?.tag == checkerCheck || nineBottom.first?.subviews.first?.tag == queenCheck) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((eighteenBottom.first?.subviews.first?.tag == checkerCheck || eighteenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                            takeStep = true
                                                                        }
                                                                    } else {
                                                                        if checker.tag == queenMove, cell.tag == (checkerCell.tag - 36) {
                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                               ((nineBottom.first?.subviews.first?.tag == checkerCheck || nineBottom.first?.subviews.first?.tag == queenCheck) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                ((eighteenBottom.first?.subviews.first?.tag == checkerCheck || eighteenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                ((twentySevenBottom.first?.subviews.first?.tag == checkerCheck || twentySevenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil)  {
                                                                                takeStep = true
                                                                            }
                                                                        } else {
                                                                            if checker.tag == queenMove, cell.tag == (checkerCell.tag - 45) {
                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                   ((nineBottom.first?.subviews.first?.tag == checkerCheck || nineBottom.first?.subviews.first?.tag == queenCheck) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                    ((eighteenBottom.first?.subviews.first?.tag == checkerCheck || eighteenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                    ((twentySevenBottom.first?.subviews.first?.tag == checkerCheck || twentySevenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                    ((thirtySixBottom.first?.subviews.first?.tag == checkerCheck || thirtySixBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil)   {
                                                                                    takeStep = true
                                                                                }
                                                                            } else {
                                                                                if checker.tag == queenMove, cell.tag == (checkerCell.tag - 54) {
                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                       ((nineBottom.first?.subviews.first?.tag == checkerCheck || nineBottom.first?.subviews.first?.tag == queenCheck) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((eighteenBottom.first?.subviews.first?.tag == checkerCheck || eighteenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((twentySevenBottom.first?.subviews.first?.tag == checkerCheck || twentySevenBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((thirtySixBottom.first?.subviews.first?.tag == checkerCheck || thirtySixBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((fortyFiveBottom.first?.subviews.first?.tag == checkerCheck || fortyFiveBottom.first?.subviews.first?.tag == queenCheck) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                        takeStep = true
                                                                                    }
                                                                                } else {
                                                                                    if checker.tag == queenMove, cell.tag == (checkerCell.tag - 21) {
                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                           ((sevenBottom.first?.subviews.first?.tag == checkerCheck || sevenBottom.first?.subviews.first?.tag == queenCheck) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                            ((fourteenBottom.first?.subviews.first?.tag == checkerCheck || fourteenBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                            takeStep = true
                                                                                        }
                                                                                    } else {
                                                                                        if checker.tag == queenMove, cell.tag == (checkerCell.tag - 28) {
                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                               ((sevenBottom.first?.subviews.first?.tag == checkerCheck || sevenBottom.first?.subviews.first?.tag == queenCheck) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((fourteenBottom.first?.subviews.first?.tag == checkerCheck || fourteenBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((twentyOneBottom.first?.subviews.first?.tag == checkerCheck || twentyOneBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                takeStep = true
                                                                                            }
                                                                                        } else {
                                                                                            if checker.tag == queenMove, cell.tag == (checkerCell.tag - 35) {
                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                   ((sevenBottom.first?.subviews.first?.tag == checkerCheck || sevenBottom.first?.subviews.first?.tag == queenCheck) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((fourteenBottom.first?.subviews.first?.tag == checkerCheck || fourteenBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((twentyOneBottom.first?.subviews.first?.tag == checkerCheck || twentyOneBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((twentyEightBottom.first?.subviews.first?.tag == checkerCheck || twentyEightBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                    takeStep = true
                                                                                                }
                                                                                            } else {
                                                                                                if checker.tag == queenMove, cell.tag == (checkerCell.tag - 42) {
                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                       ((sevenBottom.first?.subviews.first?.tag == checkerCheck || sevenBottom.first?.subviews.first?.tag == queenCheck) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((fourteenBottom.first?.subviews.first?.tag == checkerCheck || fourteenBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((twentyOneBottom.first?.subviews.first?.tag == checkerCheck || twentyOneBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((twentyEightBottom.first?.subviews.first?.tag == checkerCheck || twentyEightBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((thirtyFiveBottom.first?.subviews.first?.tag == checkerCheck || thirtyFiveBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                        takeStep = true
                                                                                                    }
                                                                                                } else {
                                                                                                    if checker.tag == queenMove, cell.tag == (checkerCell.tag - 49) {
                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                           ((sevenBottom.first?.subviews.first?.tag == checkerCheck || sevenBottom.first?.subviews.first?.tag == queenCheck) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((fourteenBottom.first?.subviews.first?.tag == checkerCheck || fourteenBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((twentyOneBottom.first?.subviews.first?.tag == checkerCheck || twentyOneBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((twentyEightBottom.first?.subviews.first?.tag == checkerCheck || twentyEightBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((thirtyFiveBottom.first?.subviews.first?.tag == checkerCheck || thirtyFiveBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((fortyTwoBottom.first?.subviews.first?.tag == checkerCheck || fortyTwoBottom.first?.subviews.first?.tag == queenCheck) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                            takeStep = true
                                                                                                        }}}}}}}}}}}}}}}}}}}}}}}}
            return takeStep ?? false
        }
    }
