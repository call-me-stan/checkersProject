//
//  Chessboard + kingsMoves.swift
//  Checkers
//
//  Created by Станислав Гусев on 03.07.2022.
//

import UIKit

extension Chessboard {
    
    func kingsMoves(sender: UIPanGestureRecognizer) {
        guard let checker = sender.view, let checkerCell = checker.superview, let board = checkerCell.superview else {return}
        let sevenTop = board.subviews.filter{($0.tag == checkerCell.tag + 7)}
        let nineTop = board.subviews.filter{($0.tag == checkerCell.tag + 9)}
        let fourteenTop = board.subviews.filter{($0.tag == checkerCell.tag + 14)}
        let eighteenTop = board.subviews.filter{($0.tag == checkerCell.tag + 18)}
        let twentyOneTop = board.subviews.filter{($0.tag == checkerCell.tag + 21)}
        let twentySevenTop = board.subviews.filter{($0.tag == checkerCell.tag + 27)}
        let twentyEightTop = board.subviews.filter{($0.tag == checkerCell.tag + 28)}
        let thirtyFiveTop = board.subviews.filter{($0.tag == checkerCell.tag + 35)}
        let thirtySixTop = board.subviews.filter{($0.tag == checkerCell.tag + 36)}
        let fortyTwoTop = board.subviews.filter{($0.tag == checkerCell.tag + 42)}
        let fortyFiveTop = board.subviews.filter{($0.tag == checkerCell.tag + 45)}
        let sevenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 7)}
        let nineBottom = board.subviews.filter{($0.tag == checkerCell.tag - 9)}
        let fourteenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 14)}
        let eighteenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 18)}
        let twentyOneBottom = board.subviews.filter{($0.tag == checkerCell.tag - 21)}
        let twentySevenBottom = board.subviews.filter{($0.tag == checkerCell.tag - 27)}
        let twentyEightBottom = board.subviews.filter{($0.tag == checkerCell.tag - 28)}
        let thirtyFiveBottom = board.subviews.filter{($0.tag == checkerCell.tag - 35)}
        let thirtySixBottom = board.subviews.filter{($0.tag == checkerCell.tag - 36)}
        let fortyTwoBottom = board.subviews.filter{($0.tag == checkerCell.tag - 42)}
        let fortyFiveBottom = board.subviews.filter{($0.tag == checkerCell.tag - 45)}
        
                
        //MARK: - BLACK QUEEN FORWARD
        for cell in board.subviews {
            if cell.frame.contains(sender.location(in: board)) {
                if checker.tag == 3, currentPlayer == .blacksMove {
                    if arrayPossibleStepsBlack.isEmpty, arrayPossibleStepsQueenBlack.isEmpty,
                       (cell.tag == (checkerCell.tag - 7) ||
                        cell.tag == (checkerCell.tag - 9) ||
                        cell.tag == (checkerCell.tag + 7) ||
                        cell.tag == (checkerCell.tag + 9))  {
                        if cell.subviews.isEmpty, cell.backgroundColor == UIColor(named: "ColorBlack") {
                            board.bringSubviewToFront(cell)
                            cell.addSubview(checker)
                            checker.frame.origin = .zero
                            nextMove(nextMove: .whitesMove, text: "White's move")
                            checkingStepsAllCheckers(sender: sender)
                        }
                    } else {
                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                           cell.tag == (checkerCell.tag + 14) {
                            if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2 {
                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                board.bringSubviewToFront(cell)
                                whiteMustBeat += 1
                                gameOver()
                                cell.addSubview(checker)
                                checker.frame.origin = .zero
                                checkBeatCheckerBlack(sender: sender)
                                checkingStepsAllCheckers(sender: sender)
                            } else {
                                if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                    board.bringSubviewToFront(cell)
                                    cell.addSubview(checker)
                                    checker.frame.origin = .zero
                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                    checkingStepsAllCheckers(sender: sender)
                                }
                            }
                        } else {
                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                               cell.tag == (checkerCell.tag + 18) {
                                if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first?.subviews.first?.tag == 0 || nineTop.first?.subviews.first?.tag == 2 {
                                    nineTop.first?.subviews.first?.removeFromSuperview()
                                    board.bringSubviewToFront(cell)
                                    whiteMustBeat += 1
                                    gameOver()
                                    cell.addSubview(checker)
                                    checker.frame.origin = .zero
                                    checkBeatCheckerBlack(sender: sender)
                                    checkingStepsAllCheckers(sender: sender)
                                } else {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil {
                                        board.bringSubviewToFront(cell)
                                        cell.addSubview(checker)
                                        checker.frame.origin = .zero
                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                        checkingStepsAllCheckers(sender: sender)
                                    }
                                }
                            } else {
                                if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                   (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                   cell.tag == (checkerCell.tag + 21) {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                       ((sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                        ((fourteenTop.first?.subviews.first?.tag == 0 || fourteenTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                        sevenTop.first?.subviews.first?.removeFromSuperview()
                                        fourteenTop.first?.subviews.first?.removeFromSuperview()
                                        board.bringSubviewToFront(cell)
                                        whiteMustBeat += 1
                                        gameOver()
                                        cell.addSubview(checker)
                                        checker.frame.origin = .zero
                                        checkBeatCheckerBlack(sender: sender)
                                        checkingStepsAllCheckers(sender: sender)
                                    } else {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                            board.bringSubviewToFront(cell)
                                            cell.addSubview(checker)
                                            checker.frame.origin = .zero
                                            nextMove(nextMove: .whitesMove, text: "White's move")
                                            checkingStepsAllCheckers(sender: sender)
                                        }
                                    }
                                } else {
                                    if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                       (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                       cell.tag == (checkerCell.tag + 27) {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                           ((nineTop.first?.subviews.first?.tag == 0 || nineTop.first?.subviews.first?.tag == 2) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                            ((eighteenTop.first?.subviews.first?.tag == 0 || eighteenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            nineTop.first?.subviews.first?.removeFromSuperview()
                                            eighteenTop.first?.subviews.first?.removeFromSuperview()
                                            board.bringSubviewToFront(cell)
                                            whiteMustBeat += 1
                                            gameOver()
                                            cell.addSubview(checker)
                                            checker.frame.origin = .zero
                                            checkBeatCheckerBlack(sender: sender)
                                            checkingStepsAllCheckers(sender: sender)
                                        } else {
                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                board.bringSubviewToFront(cell)
                                                cell.addSubview(checker)
                                                checker.frame.origin = .zero
                                                nextMove(nextMove: .whitesMove, text: "White's move")
                                                checkingStepsAllCheckers(sender: sender)
                                            }
                                        }
                                    } else {
                                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                           cell.tag == (checkerCell.tag + 36) {
                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                               ((nineTop.first?.subviews.first?.tag == 0 || nineTop.first?.subviews.first?.tag == 2) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((eighteenTop.first?.subviews.first?.tag == 0 || eighteenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((twentySevenTop.first?.subviews.first?.tag == 0 || twentySevenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                nineTop.first?.subviews.first?.removeFromSuperview()
                                                eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                board.bringSubviewToFront(cell)
                                                whiteMustBeat += 1
                                                gameOver()
                                                cell.addSubview(checker)
                                                checker.frame.origin = .zero
                                                checkBeatCheckerBlack(sender: sender)
                                                checkingStepsAllCheckers(sender: sender)
                                            } else {
                                                if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                    board.bringSubviewToFront(cell)
                                                    cell.addSubview(checker)
                                                    checker.frame.origin = .zero
                                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                                    checkingStepsAllCheckers(sender: sender)
                                                }
                                            }
                                        } else {
                                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                               cell.tag == (checkerCell.tag + 45) {
                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                   ((nineTop.first?.subviews.first?.tag == 0 || nineTop.first?.subviews.first?.tag == 2) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((eighteenTop.first?.subviews.first?.tag == 0 || eighteenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((twentySevenTop.first?.subviews.first?.tag == 0 || twentySevenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((thirtySixTop.first?.subviews.first?.tag == 0 || thirtySixTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                    nineTop.first?.subviews.first?.removeFromSuperview()
                                                    eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                    twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                    thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                                    board.bringSubviewToFront(cell)
                                                    whiteMustBeat += 1
                                                    gameOver()
                                                    cell.addSubview(checker)
                                                    checker.frame.origin = .zero
                                                    checkBeatCheckerBlack(sender: sender)
                                                    checkingStepsAllCheckers(sender: sender)
                                                } else {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                        board.bringSubviewToFront(cell)
                                                        cell.addSubview(checker)
                                                        checker.frame.origin = .zero
                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                        checkingStepsAllCheckers(sender: sender)
                                                    }
                                                }
                                            } else {
                                                if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                   (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                   cell.tag == (checkerCell.tag + 54) {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                       ((nineTop.first?.subviews.first?.tag == 0 || nineTop.first?.subviews.first?.tag == 2) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((eighteenTop.first?.subviews.first?.tag == 0 || eighteenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((twentySevenTop.first?.subviews.first?.tag == 0 || twentySevenTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((thirtySixTop.first?.subviews.first?.tag == 0 || thirtySixTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil &&  fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((fortyFiveTop.first?.subviews.first?.tag == 0 || fortyFiveTop.first?.subviews.first?.tag == 2) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                        nineTop.first?.subviews.first?.removeFromSuperview()
                                                        eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                        twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                        thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                                        fortyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                        board.bringSubviewToFront(cell)
                                                        whiteMustBeat += 1
                                                        gameOver()
                                                        cell.addSubview(checker)
                                                        checker.frame.origin = .zero
                                                        checkBeatCheckerBlack(sender: sender)
                                                        checkingStepsAllCheckers(sender: sender)
                                                    } else {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                           nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            eighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                            fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                            board.bringSubviewToFront(cell)
                                                            cell.addSubview(checker)
                                                            checker.frame.origin = .zero
                                                            nextMove(nextMove: .whitesMove, text: "White's move")
                                                            checkingStepsAllCheckers(sender: sender)
                                                        }
                                                    }
                                                } else {
                                                    if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                       (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                       cell.tag == (checkerCell.tag + 28) {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                           ((sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((fourteenTop.first?.subviews.first?.tag == 0 || fourteenTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((twentyOneTop.first?.subviews.first?.tag == 0 || twentyOneTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                            sevenTop.first?.subviews.first?.removeFromSuperview()
                                                            fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                            twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                            board.bringSubviewToFront(cell)
                                                            whiteMustBeat += 1
                                                            gameOver()
                                                            cell.addSubview(checker)
                                                            checker.frame.origin = .zero
                                                            checkBeatCheckerBlack(sender: sender)
                                                            checkingStepsAllCheckers(sender: sender)
                                                        } else {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                board.bringSubviewToFront(cell)
                                                                cell.addSubview(checker)
                                                                checker.frame.origin = .zero
                                                                nextMove(nextMove: .whitesMove, text: "White's move")
                                                                checkingStepsAllCheckers(sender: sender)
                                                            }
                                                        }
                                                    } else {
                                                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                           cell.tag == (checkerCell.tag + 35) {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               ((sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((fourteenTop.first?.subviews.first?.tag == 0 || fourteenTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((twentyOneTop.first?.subviews.first?.tag == 0 || twentyOneTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((twentyEightTop.first?.subviews.first?.tag == 0 || twentyEightTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                board.bringSubviewToFront(cell)
                                                                whiteMustBeat += 1
                                                                gameOver()
                                                                cell.addSubview(checker)
                                                                checker.frame.origin = .zero
                                                                checkBeatCheckerBlack(sender: sender)
                                                                checkingStepsAllCheckers(sender: sender)
                                                            } else {
                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                    board.bringSubviewToFront(cell)
                                                                    cell.addSubview(checker)
                                                                    checker.frame.origin = .zero
                                                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                                                    checkingStepsAllCheckers(sender: sender)
                                                                }
                                                            }
                                                        } else {
                                                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                               cell.tag == (checkerCell.tag + 42) {
                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                   ((sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((fourteenTop.first?.subviews.first?.tag == 0 || fourteenTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyOneTop.first?.subviews.first?.tag == 0 || twentyOneTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyEightTop.first?.subviews.first?.tag == 0 || twentyEightTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((thirtyFiveTop.first?.subviews.first?.tag == 0 || thirtyFiveTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                    thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                    board.bringSubviewToFront(cell)
                                                                    whiteMustBeat += 1
                                                                    gameOver()
                                                                    cell.addSubview(checker)
                                                                    checker.frame.origin = .zero
                                                                    checkBeatCheckerBlack(sender: sender)
                                                                    checkingStepsAllCheckers(sender: sender)
                                                                } else {
                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                       sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                        thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                        board.bringSubviewToFront(cell)
                                                                        cell.addSubview(checker)
                                                                        checker.frame.origin = .zero
                                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                                        checkingStepsAllCheckers(sender: sender)
                                                                    }
                                                                }
                                                            } else {
                                                                if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                   (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                   cell.tag == (checkerCell.tag + 49) {
                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                       ((sevenTop.first?.subviews.first?.tag == 0 || sevenTop.first?.subviews.first?.tag == 2) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((fourteenTop.first?.subviews.first?.tag == 0 || fourteenTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyOneTop.first?.subviews.first?.tag == 0 || twentyOneTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyEightTop.first?.subviews.first?.tag == 0 || twentyEightTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((thirtyFiveTop.first?.subviews.first?.tag == 0 || thirtyFiveTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((fortyTwoTop.first?.subviews.first?.tag == 0 || fortyTwoTop.first?.subviews.first?.tag == 2) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                        sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                        fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                        twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                        twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                        thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                        fortyTwoTop.first?.subviews.first?.removeFromSuperview()
                                                                        board.bringSubviewToFront(cell)
                                                                        whiteMustBeat += 1
                                                                        gameOver()
                                                                        cell.addSubview(checker)
                                                                        checker.frame.origin = .zero
                                                                        checkBeatCheckerBlack(sender: sender)
                                                                        checkingStepsAllCheckers(sender: sender)
                                                                    } else {
                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                           sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                            board.bringSubviewToFront(cell)
                                                                            cell.addSubview(checker)
                                                                            checker.frame.origin = .zero
                                                                            nextMove(nextMove: .whitesMove, text: "White's move")
                                                                            checkingStepsAllCheckers(sender: sender)
                                                                        }
                                                                    }
                                                                    //MARK: - BLACK QUEEN BACK
                                                                } else {
                                                                    if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                       (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                       cell.tag == (checkerCell.tag - 14) {
                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2 {
                                                                            sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                            board.bringSubviewToFront(cell)
                                                                            whiteMustBeat += 1
                                                                            gameOver()
                                                                            cell.addSubview(checker)
                                                                            checker.frame.origin = .zero
                                                                            checkBeatCheckerBlack(sender: sender)
                                                                            checkingStepsAllCheckers(sender: sender)
                                                                        } else {
                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                board.bringSubviewToFront(cell)
                                                                                cell.addSubview(checker)
                                                                                checker.frame.origin = .zero
                                                                                nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                checkingStepsAllCheckers(sender: sender)
                                                                            }
                                                                        }
                                                                    } else {
                                                                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                           cell.tag == (checkerCell.tag - 18) {
                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first?.subviews.first?.tag == 0 || nineBottom.first?.subviews.first?.tag == 2 {
                                                                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                board.bringSubviewToFront(cell)
                                                                                whiteMustBeat += 1
                                                                                gameOver()
                                                                                cell.addSubview(checker)
                                                                                checker.frame.origin = .zero
                                                                                checkBeatCheckerBlack(sender: sender)
                                                                                checkingStepsAllCheckers(sender: sender)
                                                                            } else {
                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                    board.bringSubviewToFront(cell)
                                                                                    cell.addSubview(checker)
                                                                                    checker.frame.origin = .zero
                                                                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                }
                                                                            }
                                                                        } else {
                                                                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                               cell.tag == (checkerCell.tag - 21) {
                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                   ((sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                    ((fourteenBottom.first?.subviews.first?.tag == 0 || fourteenBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                    fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                    board.bringSubviewToFront(cell)
                                                                                    whiteMustBeat += 1
                                                                                    gameOver()
                                                                                    cell.addSubview(checker)
                                                                                    checker.frame.origin = .zero
                                                                                    checkBeatCheckerBlack(sender: sender)
                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                } else {
                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                        board.bringSubviewToFront(cell)
                                                                                        cell.addSubview(checker)
                                                                                        checker.frame.origin = .zero
                                                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                    }
                                                                                }
                                                                            } else {
                                                                                if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                   (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                                   cell.tag == (checkerCell.tag - 27) {
                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                       ((nineBottom.first?.subviews.first?.tag == 0 || nineBottom.first?.subviews.first?.tag == 2) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((eighteenBottom.first?.subviews.first?.tag == 0 || eighteenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                        nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                        eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                        board.bringSubviewToFront(cell)
                                                                                        whiteMustBeat += 1
                                                                                        gameOver()
                                                                                        cell.addSubview(checker)
                                                                                        checker.frame.origin = .zero
                                                                                        checkBeatCheckerBlack(sender: sender)
                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                    } else {
                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                            board.bringSubviewToFront(cell)
                                                                                            cell.addSubview(checker)
                                                                                            checker.frame.origin = .zero
                                                                                            nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                        }
                                                                                    }
                                                                                } else {
                                                                                    if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                       (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                                       cell.tag == (checkerCell.tag - 36) {
                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                           ((nineBottom.first?.subviews.first?.tag == 0 || nineBottom.first?.subviews.first?.tag == 2) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                            ((eighteenBottom.first?.subviews.first?.tag == 0 || eighteenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                            ((twentySevenBottom.first?.subviews.first?.tag == 0 || twentySevenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                            nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                            eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                            twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                            board.bringSubviewToFront(cell)
                                                                                            whiteMustBeat += 1
                                                                                            gameOver()
                                                                                            cell.addSubview(checker)
                                                                                            checker.frame.origin = .zero
                                                                                            checkBeatCheckerBlack(sender: sender)
                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                        } else {
                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                               nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                board.bringSubviewToFront(cell)
                                                                                                cell.addSubview(checker)
                                                                                                checker.frame.origin = .zero
                                                                                                nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                            }
                                                                                        }
                                                                                    } else {
                                                                                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                                           cell.tag == (checkerCell.tag - 45) {
                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                               ((nineBottom.first?.subviews.first?.tag == 0 || nineBottom.first?.subviews.first?.tag == 2) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((eighteenBottom.first?.subviews.first?.tag == 0 || eighteenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((twentySevenBottom.first?.subviews.first?.tag == 0 || twentySevenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((thirtySixBottom.first?.subviews.first?.tag == 0 || thirtySixBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                board.bringSubviewToFront(cell)
                                                                                                whiteMustBeat += 1
                                                                                                gameOver()
                                                                                                cell.addSubview(checker)
                                                                                                checker.frame.origin = .zero
                                                                                                checkBeatCheckerBlack(sender: sender)
                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                            } else {
                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                   nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                    board.bringSubviewToFront(cell)
                                                                                                    cell.addSubview(checker)
                                                                                                    checker.frame.origin = .zero
                                                                                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                }
                                                                                            }
                                                                                        } else {
                                                                                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty), cell.tag == (checkerCell.tag - 54) {
                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                   ((nineBottom.first?.subviews.first?.tag == 0 || nineBottom.first?.subviews.first?.tag == 2) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((eighteenBottom.first?.subviews.first?.tag == 0 || eighteenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((twentySevenBottom.first?.subviews.first?.tag == 0 || twentySevenBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((thirtySixBottom.first?.subviews.first?.tag == 0 || thirtySixBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((fortyFiveBottom.first?.subviews.first?.tag == 0 || fortyFiveBottom.first?.subviews.first?.tag == 2) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                    nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    fortyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    board.bringSubviewToFront(cell)
                                                                                                    whiteMustBeat += 1
                                                                                                    gameOver()
                                                                                                    cell.addSubview(checker)
                                                                                                    checker.frame.origin = .zero
                                                                                                    checkBeatCheckerBlack(sender: sender)
                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                } else {
                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                        eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                        twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                        thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                        fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                        board.bringSubviewToFront(cell)
                                                                                                        cell.addSubview(checker)
                                                                                                        checker.frame.origin = .zero
                                                                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                    }
                                                                                                }
                                                                                            } else {
                                                                                                if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                                   (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                                                   cell.tag == (checkerCell.tag - 28) {
                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                       ((sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((fourteenBottom.first?.subviews.first?.tag == 0 || fourteenBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((twentyOneBottom.first?.subviews.first?.tag == 0 || twentyOneBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                        sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        board.bringSubviewToFront(cell)
                                                                                                        whiteMustBeat += 1
                                                                                                        gameOver()
                                                                                                        cell.addSubview(checker)
                                                                                                        checker.frame.origin = .zero
                                                                                                        checkBeatCheckerBlack(sender: sender)
                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                    } else {
                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                           sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                            board.bringSubviewToFront(cell)
                                                                                                            cell.addSubview(checker)
                                                                                                            checker.frame.origin = .zero
                                                                                                            nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                                        }
                                                                                                    }
                                                                                                } else {
                                                                                                    if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                                       (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty), cell.tag == (checkerCell.tag - 35) {
                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                           ((sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((fourteenBottom.first?.subviews.first?.tag == 0 || fourteenBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((twentyOneBottom.first?.subviews.first?.tag == 0 || twentyOneBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((twentyEightBottom.first?.subviews.first?.tag == 0 || twentyEightBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                            sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            board.bringSubviewToFront(cell)
                                                                                                            whiteMustBeat += 1
                                                                                                            gameOver()
                                                                                                            cell.addSubview(checker)
                                                                                                            checker.frame.origin = .zero
                                                                                                            checkBeatCheckerBlack(sender: sender)
                                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                                        } else {
                                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                               sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                board.bringSubviewToFront(cell)
                                                                                                                cell.addSubview(checker)
                                                                                                                checker.frame.origin = .zero
                                                                                                                nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                                            }
                                                                                                        }
                                                                                                    } else {
                                                                                                        if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                                           (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty),
                                                                                                           cell.tag == (checkerCell.tag - 42) {
                                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                               ((sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((fourteenBottom.first?.subviews.first?.tag == 0 || fourteenBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((twentyOneBottom.first?.subviews.first?.tag == 0 || twentyOneBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((twentyEightBottom.first?.subviews.first?.tag == 0 || twentyEightBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((thirtyFiveBottom.first?.subviews.first?.tag == 0 || thirtyFiveBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                board.bringSubviewToFront(cell)
                                                                                                                whiteMustBeat += 1
                                                                                                                gameOver()
                                                                                                                cell.addSubview(checker)
                                                                                                                checker.frame.origin = .zero
                                                                                                                checkBeatCheckerBlack(sender: sender)
                                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                                            } else {
                                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                   sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                    board.bringSubviewToFront(cell)
                                                                                                                    cell.addSubview(checker)
                                                                                                                    checker.frame.origin = .zero
                                                                                                                    nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                                }
                                                                                                            }
                                                                                                        } else {
                                                                                                            if (arrayPossibleStepsBlack.contains(checkerCell.tag) || arrayPossibleStepsBlack.isEmpty),
                                                                                                               (arrayPossibleStepsQueenBlack.contains(checkerCell.tag) || arrayPossibleStepsQueenBlack.isEmpty), cell.tag == (checkerCell.tag - 49) {
                                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                   ((sevenBottom.first?.subviews.first?.tag == 0 || sevenBottom.first?.subviews.first?.tag == 2) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((fourteenBottom.first?.subviews.first?.tag == 0 || fourteenBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((twentyOneBottom.first?.subviews.first?.tag == 0 || twentyOneBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((twentyEightBottom.first?.subviews.first?.tag == 0 || twentyEightBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((thirtyFiveBottom.first?.subviews.first?.tag == 0 || thirtyFiveBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((fortyTwoBottom.first?.subviews.first?.tag == 0 || fortyTwoBottom.first?.subviews.first?.tag == 2) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    fortyTwoBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    board.bringSubviewToFront(cell)
                                                                                                                    whiteMustBeat += 1
                                                                                                                    gameOver()
                                                                                                                    cell.addSubview(checker)
                                                                                                                    checker.frame.origin = .zero
                                                                                                                    checkBeatCheckerBlack(sender: sender)
                                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                                } else {
                                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                       sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                        board.bringSubviewToFront(cell)
                                                                                                                        cell.addSubview(checker)
                                                                                                                        checker.frame.origin = .zero
                                                                                                                        nextMove(nextMove: .whitesMove, text: "White's move")
                                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                                    }}}}}}}}}}}}}}}}}}}}}}}}}
                    // MARK: - WHITE QUEEN FORWARD
                } else {
                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                       checker.tag == 2, currentPlayer == .whitesMove {
                        if (cell.tag == (checkerCell.tag + 7) ||
                            cell.tag == (checkerCell.tag + 9) ||
                            cell.tag == (checkerCell.tag - 7) ||
                            cell.tag == (checkerCell.tag - 9))  {
                            if cell.subviews.isEmpty, cell.backgroundColor == UIColor(named: "ColorBlack") {
                                board.bringSubviewToFront(cell)
                                cell.addSubview(checker)
                                checker.frame.origin = .zero
                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                checkingStepsAllCheckers(sender: sender)
                            }
                        } else {
                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                               cell.tag == (checkerCell.tag + 14) {
                                if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3 {
                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                    board.bringSubviewToFront(cell)
                                    blackMustBeat += 1
                                    gameOver()
                                    cell.addSubview(checker)
                                    checker.frame.origin = .zero
                                    checkBeatCheckerWhite(sender: sender)
                                    checkingStepsAllCheckers(sender: sender)
                                } else {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                        board.bringSubviewToFront(cell)
                                        cell.addSubview(checker)
                                        checker.frame.origin = .zero
                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                        checkingStepsAllCheckers(sender: sender)
                                    }
                                }
                            } else {
                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                   cell.tag == (checkerCell.tag + 18) {
                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3 {
                                        nineTop.first?.subviews.first?.removeFromSuperview()
                                        board.bringSubviewToFront(cell)
                                        blackMustBeat += 1
                                        gameOver()
                                        cell.addSubview(checker)
                                        checker.frame.origin = .zero
                                        checkBeatCheckerWhite(sender: sender)
                                        checkingStepsAllCheckers(sender: sender)
                                    } else {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil {
                                            board.bringSubviewToFront(cell)
                                            cell.addSubview(checker)
                                            checker.frame.origin = .zero
                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                            checkingStepsAllCheckers(sender: sender)
                                        }
                                    }
                                } else {
                                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                       cell.tag == (checkerCell.tag + 21) {
                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                           ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                            ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                            sevenTop.first?.subviews.first?.removeFromSuperview()
                                            fourteenTop.first?.subviews.first?.removeFromSuperview()
                                            board.bringSubviewToFront(cell)
                                            blackMustBeat += 1
                                            gameOver()
                                            cell.addSubview(checker)
                                            checker.frame.origin = .zero
                                            checkBeatCheckerWhite(sender: sender)
                                            checkingStepsAllCheckers(sender: sender)
                                        } else {
                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                board.bringSubviewToFront(cell)
                                                cell.addSubview(checker)
                                                checker.frame.origin = .zero
                                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                                checkingStepsAllCheckers(sender: sender)
                                            }
                                        }
                                    } else {
                                        if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                           (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                           cell.tag == (checkerCell.tag + 27) {
                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                               ((nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                ((eighteenTop.first?.subviews.first?.tag == 1 || eighteenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                nineTop.first?.subviews.first?.removeFromSuperview()
                                                eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                board.bringSubviewToFront(cell)
                                                blackMustBeat += 1
                                                gameOver()
                                                cell.addSubview(checker)
                                                checker.frame.origin = .zero
                                                checkBeatCheckerWhite(sender: sender)
                                                checkingStepsAllCheckers(sender: sender)
                                            } else {
                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                   nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                    eighteenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                    board.bringSubviewToFront(cell)
                                                    cell.addSubview(checker)
                                                    checker.frame.origin = .zero
                                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                                    checkingStepsAllCheckers(sender: sender)
                                                }
                                            }
                                        } else {
                                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                               cell.tag == (checkerCell.tag + 36) {
                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                   ((nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((eighteenTop.first?.subviews.first?.tag == 1 || eighteenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                    ((twentySevenTop.first?.subviews.first?.tag == 1 || twentySevenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                    nineTop.first?.subviews.first?.removeFromSuperview()
                                                    eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                    twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                    board.bringSubviewToFront(cell)
                                                    blackMustBeat += 1
                                                    gameOver()
                                                    cell.addSubview(checker)
                                                    checker.frame.origin = .zero
                                                    checkBeatCheckerWhite(sender: sender)
                                                    checkingStepsAllCheckers(sender: sender)
                                                } else {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                        board.bringSubviewToFront(cell)
                                                        cell.addSubview(checker)
                                                        checker.frame.origin = .zero
                                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                                        checkingStepsAllCheckers(sender: sender)
                                                    }
                                                }
                                            } else {
                                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                   cell.tag == (checkerCell.tag + 45) {
                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                       ((nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((eighteenTop.first?.subviews.first?.tag == 1 || eighteenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((twentySevenTop.first?.subviews.first?.tag == 1 || twentySevenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                        ((thirtySixTop.first?.subviews.first?.tag == 1 || thirtySixTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                        nineTop.first?.subviews.first?.removeFromSuperview()
                                                        eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                        twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                        thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                                        board.bringSubviewToFront(cell)
                                                        blackMustBeat += 1
                                                        gameOver()
                                                        cell.addSubview(checker)
                                                        checker.frame.origin = .zero
                                                        checkBeatCheckerWhite(sender: sender)
                                                        checkingStepsAllCheckers(sender: sender)
                                                    } else {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                            board.bringSubviewToFront(cell)
                                                            cell.addSubview(checker)
                                                            checker.frame.origin = .zero
                                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                                            checkingStepsAllCheckers(sender: sender)
                                                        }
                                                    }
                                                } else {
                                                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                       cell.tag == (checkerCell.tag + 54) {
                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                           ((nineTop.first?.subviews.first?.tag == 1 || nineTop.first?.subviews.first?.tag == 3) && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((eighteenTop.first?.subviews.first?.tag == 1 || eighteenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((twentySevenTop.first?.subviews.first?.tag == 1 || twentySevenTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((thirtySixTop.first?.subviews.first?.tag == 1 || thirtySixTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                            ((fortyFiveTop.first?.subviews.first?.tag == 1 || fortyFiveTop.first?.subviews.first?.tag == 3) && nineTop.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil && thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                            nineTop.first?.subviews.first?.removeFromSuperview()
                                                            eighteenTop.first?.subviews.first?.removeFromSuperview()
                                                            twentySevenTop.first?.subviews.first?.removeFromSuperview()
                                                            thirtySixTop.first?.subviews.first?.removeFromSuperview()
                                                            fortyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                            board.bringSubviewToFront(cell)
                                                            blackMustBeat += 1
                                                            gameOver()
                                                            cell.addSubview(checker)
                                                            checker.frame.origin = .zero
                                                            checkBeatCheckerWhite(sender: sender)
                                                            checkingStepsAllCheckers(sender: sender)
                                                        } else {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               nineTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                eighteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                twentySevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                thirtySixTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                fortyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                board.bringSubviewToFront(cell)
                                                                cell.addSubview(checker)
                                                                checker.frame.origin = .zero
                                                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                checkingStepsAllCheckers(sender: sender)
                                                            }
                                                        }
                                                    } else {
                                                        if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                           (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                           cell.tag == (checkerCell.tag + 28) {
                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                               ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                ((twentyOneTop.first?.subviews.first?.tag == 1 || twentyOneTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                board.bringSubviewToFront(cell)
                                                                blackMustBeat += 1
                                                                gameOver()
                                                                cell.addSubview(checker)
                                                                checker.frame.origin = .zero
                                                                checkBeatCheckerWhite(sender: sender)
                                                                checkingStepsAllCheckers(sender: sender)
                                                            } else {
                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                   sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                    fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                    twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                    board.bringSubviewToFront(cell)
                                                                    cell.addSubview(checker)
                                                                    checker.frame.origin = .zero
                                                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                    checkingStepsAllCheckers(sender: sender)
                                                                }
                                                            }
                                                        } else {
                                                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                               cell.tag == (checkerCell.tag + 35) {
                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                   ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyOneTop.first?.subviews.first?.tag == 1 || twentyOneTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                    ((twentyEightTop.first?.subviews.first?.tag == 1 || twentyEightTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                    sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                    fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                    twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                    board.bringSubviewToFront(cell)
                                                                    blackMustBeat += 1
                                                                    gameOver()
                                                                    cell.addSubview(checker)
                                                                    checker.frame.origin = .zero
                                                                    checkBeatCheckerWhite(sender: sender)
                                                                    checkingStepsAllCheckers(sender: sender)
                                                                } else {
                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                        board.bringSubviewToFront(cell)
                                                                        cell.addSubview(checker)
                                                                        checker.frame.origin = .zero
                                                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                        checkingStepsAllCheckers(sender: sender)
                                                                    }
                                                                }
                                                            } else {
                                                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                   cell.tag == (checkerCell.tag + 42) {
                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                       ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyOneTop.first?.subviews.first?.tag == 1 || twentyOneTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((twentyEightTop.first?.subviews.first?.tag == 1 || twentyEightTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                        ((thirtyFiveTop.first?.subviews.first?.tag == 1 || thirtyFiveTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                        sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                        fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                        twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                        twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                        thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                        board.bringSubviewToFront(cell)
                                                                        blackMustBeat += 1
                                                                        gameOver()
                                                                        cell.addSubview(checker)
                                                                        checker.frame.origin = .zero
                                                                        checkBeatCheckerWhite(sender: sender)
                                                                        checkingStepsAllCheckers(sender: sender)
                                                                    } else {
                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                           sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                            thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                            board.bringSubviewToFront(cell)
                                                                            cell.addSubview(checker)
                                                                            checker.frame.origin = .zero
                                                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                            checkingStepsAllCheckers(sender: sender)
                                                                        }
                                                                    }
                                                                } else {
                                                                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                       cell.tag == (checkerCell.tag + 49) {
                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                           ((sevenTop.first?.subviews.first?.tag == 1 || sevenTop.first?.subviews.first?.tag == 3) && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((fourteenTop.first?.subviews.first?.tag == 1 || fourteenTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((twentyOneTop.first?.subviews.first?.tag == 1 || twentyOneTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((twentyEightTop.first?.subviews.first?.tag == 1 || twentyEightTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((thirtyFiveTop.first?.subviews.first?.tag == 1 || thirtyFiveTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                            ((fortyTwoTop.first?.subviews.first?.tag == 1 || fortyTwoTop.first?.subviews.first?.tag == 3) && sevenTop.first(where: {$0.subviews.isEmpty}) != nil && fourteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil && twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                            sevenTop.first?.subviews.first?.removeFromSuperview()
                                                                            fourteenTop.first?.subviews.first?.removeFromSuperview()
                                                                            twentyOneTop.first?.subviews.first?.removeFromSuperview()
                                                                            twentyEightTop.first?.subviews.first?.removeFromSuperview()
                                                                            thirtyFiveTop.first?.subviews.first?.removeFromSuperview()
                                                                            fortyTwoTop.first?.subviews.first?.removeFromSuperview()
                                                                            board.bringSubviewToFront(cell)
                                                                            blackMustBeat += 1
                                                                            gameOver()
                                                                            cell.addSubview(checker)
                                                                            checker.frame.origin = .zero
                                                                            checkBeatCheckerWhite(sender: sender)
                                                                            checkingStepsAllCheckers(sender: sender)
                                                                        } else {
                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                               sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                fourteenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                twentyOneTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                twentyEightTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                thirtyFiveTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                fortyTwoTop.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                board.bringSubviewToFront(cell)
                                                                                cell.addSubview(checker)
                                                                                checker.frame.origin = .zero
                                                                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                checkingStepsAllCheckers(sender: sender)
                                                                            }
                                                                        }
                                                                        //MARK: - WHITE QUEEN BACK
                                                                    } else {
                                                                        if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                           (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                           cell.tag == (checkerCell.tag - 14) {
                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3 {
                                                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                board.bringSubviewToFront(cell)
                                                                                blackMustBeat += 1
                                                                                gameOver()
                                                                                cell.addSubview(checker)
                                                                                checker.frame.origin = .zero
                                                                                checkBeatCheckerWhite(sender: sender)
                                                                                checkingStepsAllCheckers(sender: sender)
                                                                            } else {
                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                    board.bringSubviewToFront(cell)
                                                                                    cell.addSubview(checker)
                                                                                    checker.frame.origin = .zero
                                                                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                }
                                                                            }
                                                                        } else {
                                                                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                               cell.tag == (checkerCell.tag - 18) {
                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3 {
                                                                                    nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                    board.bringSubviewToFront(cell)
                                                                                    blackMustBeat += 1
                                                                                    gameOver()
                                                                                    cell.addSubview(checker)
                                                                                    checker.frame.origin = .zero
                                                                                    checkBeatCheckerWhite(sender: sender)
                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                } else {
                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                        board.bringSubviewToFront(cell)
                                                                                        cell.addSubview(checker)
                                                                                        checker.frame.origin = .zero
                                                                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                    }
                                                                                }
                                                                            } else {
                                                                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                   cell.tag == (checkerCell.tag - 21) {
                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                       ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                        ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                        sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                        fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                        board.bringSubviewToFront(cell)
                                                                                        blackMustBeat += 1
                                                                                        gameOver()
                                                                                        cell.addSubview(checker)
                                                                                        checker.frame.origin = .zero
                                                                                        checkBeatCheckerWhite(sender: sender)
                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                    } else {
                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                            board.bringSubviewToFront(cell)
                                                                                            cell.addSubview(checker)
                                                                                            checker.frame.origin = .zero
                                                                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                        }
                                                                                    }
                                                                                } else {
                                                                                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                       cell.tag == (checkerCell.tag - 27) {
                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                           ((nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                            ((eighteenBottom.first?.subviews.first?.tag == 1 || eighteenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                            nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                            eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                            board.bringSubviewToFront(cell)
                                                                                            blackMustBeat += 1
                                                                                            gameOver()
                                                                                            cell.addSubview(checker)
                                                                                            checker.frame.origin = .zero
                                                                                            checkBeatCheckerWhite(sender: sender)
                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                        } else {
                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                board.bringSubviewToFront(cell)
                                                                                                cell.addSubview(checker)
                                                                                                checker.frame.origin = .zero
                                                                                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                            }
                                                                                        }
                                                                                    } else {
                                                                                        if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                           (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                           cell.tag == (checkerCell.tag - 36) {
                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                               ((nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((eighteenBottom.first?.subviews.first?.tag == 1 || eighteenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                ((twentySevenBottom.first?.subviews.first?.tag == 1 || twentySevenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                board.bringSubviewToFront(cell)
                                                                                                blackMustBeat += 1
                                                                                                gameOver()
                                                                                                cell.addSubview(checker)
                                                                                                checker.frame.origin = .zero
                                                                                                checkBeatCheckerWhite(sender: sender)
                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                            } else {
                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                   nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenTop.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                    board.bringSubviewToFront(cell)
                                                                                                    cell.addSubview(checker)
                                                                                                    checker.frame.origin = .zero
                                                                                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                }
                                                                                            }
                                                                                        } else {
                                                                                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                               cell.tag == (checkerCell.tag - 45) {
                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                   ((nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((eighteenBottom.first?.subviews.first?.tag == 1 || eighteenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((twentySevenBottom.first?.subviews.first?.tag == 1 || twentySevenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                    ((thirtySixBottom.first?.subviews.first?.tag == 1 || thirtySixBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                    nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                    board.bringSubviewToFront(cell)
                                                                                                    blackMustBeat += 1
                                                                                                    gameOver()
                                                                                                    cell.addSubview(checker)
                                                                                                    checker.frame.origin = .zero
                                                                                                    checkBeatCheckerWhite(sender: sender)
                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                } else {
                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                       nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                        board.bringSubviewToFront(cell)
                                                                                                        cell.addSubview(checker)
                                                                                                        checker.frame.origin = .zero
                                                                                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                    }
                                                                                                }
                                                                                            } else {
                                                                                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                                   cell.tag == (checkerCell.tag - 54) {
                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                       ((nineBottom.first?.subviews.first?.tag == 1 || nineBottom.first?.subviews.first?.tag == 3) && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((eighteenBottom.first?.subviews.first?.tag == 1 || eighteenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((twentySevenBottom.first?.subviews.first?.tag == 1 || twentySevenBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((thirtySixBottom.first?.subviews.first?.tag == 1 || thirtySixBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                        ((fortyFiveBottom.first?.subviews.first?.tag == 1 || fortyFiveBottom.first?.subviews.first?.tag == 3) && nineBottom.first(where: {$0.subviews.isEmpty}) != nil && eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                        nineBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        eighteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        twentySevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        thirtySixBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        fortyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                        board.bringSubviewToFront(cell)
                                                                                                        blackMustBeat += 1
                                                                                                        gameOver()
                                                                                                        cell.addSubview(checker)
                                                                                                        checker.frame.origin = .zero
                                                                                                        checkBeatCheckerWhite(sender: sender)
                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                    } else {
                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black, nineBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            eighteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            twentySevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            thirtySixBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                            fortyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                            board.bringSubviewToFront(cell)
                                                                                                            cell.addSubview(checker)
                                                                                                            checker.frame.origin = .zero
                                                                                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                                        }
                                                                                                    }
                                                                                                } else {
                                                                                                    if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                                       (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                                       cell.tag == (checkerCell.tag - 28) {
                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                           ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                            ((twentyOneBottom.first?.subviews.first?.tag == 1 || twentyOneBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                            sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                            board.bringSubviewToFront(cell)
                                                                                                            blackMustBeat += 1
                                                                                                            gameOver()
                                                                                                            cell.addSubview(checker)
                                                                                                            checker.frame.origin = .zero
                                                                                                            checkBeatCheckerWhite(sender: sender)
                                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                                        } else {
                                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                               sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                board.bringSubviewToFront(cell)
                                                                                                                cell.addSubview(checker)
                                                                                                                checker.frame.origin = .zero
                                                                                                                nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                                            }
                                                                                                        }
                                                                                                    } else {
                                                                                                        if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                                           (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                                           cell.tag == (checkerCell.tag - 35) {
                                                                                                            if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                               ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((twentyOneBottom.first?.subviews.first?.tag == 1 || twentyOneBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                ((twentyEightBottom.first?.subviews.first?.tag == 1 || twentyEightBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                                sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                board.bringSubviewToFront(cell)
                                                                                                                blackMustBeat += 1
                                                                                                                gameOver()
                                                                                                                cell.addSubview(checker)
                                                                                                                checker.frame.origin = .zero
                                                                                                                checkBeatCheckerWhite(sender: sender)
                                                                                                                checkingStepsAllCheckers(sender: sender)
                                                                                                            } else {
                                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                   sevenTop.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                    twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                    board.bringSubviewToFront(cell)
                                                                                                                    cell.addSubview(checker)
                                                                                                                    checker.frame.origin = .zero
                                                                                                                    nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                                }
                                                                                                            }
                                                                                                        } else {
                                                                                                            if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                                               (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                                               cell.tag == (checkerCell.tag - 42) {
                                                                                                                if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                   ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((twentyOneBottom.first?.subviews.first?.tag == 1 || twentyOneBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((twentyEightBottom.first?.subviews.first?.tag == 1 || twentyEightBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                    ((thirtyFiveBottom.first?.subviews.first?.tag == 1 || thirtyFiveBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                                    sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                    board.bringSubviewToFront(cell)
                                                                                                                    blackMustBeat += 1
                                                                                                                    gameOver()
                                                                                                                    cell.addSubview(checker)
                                                                                                                    checker.frame.origin = .zero
                                                                                                                    checkBeatCheckerWhite(sender: sender)
                                                                                                                    checkingStepsAllCheckers(sender: sender)
                                                                                                                } else {
                                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                       sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                        thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                        board.bringSubviewToFront(cell)
                                                                                                                        cell.addSubview(checker)
                                                                                                                        checker.frame.origin = .zero
                                                                                                                        nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                                    }
                                                                                                                }
                                                                                                            } else {
                                                                                                                if (arrayPossibleStepsWhite.contains(checkerCell.tag) || arrayPossibleStepsWhite.isEmpty),
                                                                                                                   (arrayPossibleStepsQueenWhite.contains(checkerCell.tag) || arrayPossibleStepsQueenWhite.isEmpty),
                                                                                                                   cell.tag == (checkerCell.tag - 49) {
                                                                                                                    if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                       ((sevenBottom.first?.subviews.first?.tag == 1 || sevenBottom.first?.subviews.first?.tag == 3) && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                        ((fourteenBottom.first?.subviews.first?.tag == 1 || fourteenBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                        ((twentyOneBottom.first?.subviews.first?.tag == 1 || twentyOneBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                        ((twentyEightBottom.first?.subviews.first?.tag == 1 || twentyEightBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                        ((thirtyFiveBottom.first?.subviews.first?.tag == 1 || thirtyFiveBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil) ||
                                                                                                                        ((fortyTwoBottom.first?.subviews.first?.tag == 1 || fortyTwoBottom.first?.subviews.first?.tag == 3) && sevenBottom.first(where: {$0.subviews.isEmpty}) != nil && fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil && twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil && thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil) {
                                                                                                                        sevenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        fourteenBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        twentyOneBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        twentyEightBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        thirtyFiveBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        fortyTwoBottom.first?.subviews.first?.removeFromSuperview()
                                                                                                                        board.bringSubviewToFront(cell)
                                                                                                                        blackMustBeat += 1
                                                                                                                        gameOver()
                                                                                                                        cell.addSubview(checker)
                                                                                                                        checker.frame.origin = .zero
                                                                                                                        checkBeatCheckerWhite(sender: sender)
                                                                                                                        checkingStepsAllCheckers(sender: sender)
                                                                                                                    } else {
                                                                                                                        if cell.subviews.isEmpty, cell.backgroundColor == .black,
                                                                                                                           sevenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            fourteenBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            twentyOneBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            twentyEightBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            thirtyFiveBottom.first(where: {$0.subviews.isEmpty}) != nil &&
                                                                                                                            fortyTwoBottom.first(where: {$0.subviews.isEmpty}) != nil {
                                                                                                                            board.bringSubviewToFront(cell)
                                                                                                                            cell.addSubview(checker)
                                                                                                                            checker.frame.origin = .zero
                                                                                                                            nextMove(nextMove: .blacksMove, text: "Black's move")
                                                                                                                            checkingStepsAllCheckers(sender: sender)
                                                                                                                        }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
}
