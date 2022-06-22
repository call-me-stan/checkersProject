//
//  Chessboard.swift
//  Checkers
//
//  Created by Станислав Гусев on 09.04.2022.

import UIKit

class Chessboard: NSObject {
    
    private let currentLineForChecker: [Int] = [0,1,2,5,6,7]
        
    func createBoard(with chessboard: UIView) {
        var sizeSquare: CGSize {
            return CGSize(width: chessboard.frame.size.width / 8.0, height: chessboard.frame.size.height / 8.0)
        }
        
        var sizeChecker: CGSize {
            return CGSize(width:  sizeSquare.width * 0.8, height: sizeSquare.height * 0.8)
        }
        
        var checkerCenter: CGPoint {
            return CGPoint(x: sizeSquare.width / 2.0, y: sizeSquare.height / 2.0)
        }
        
        var currentNumberCell: Int = -1
        for i in 0..<8 {
            for j in 0..<8 {
                currentNumberCell += 1
                let square = SquareView(
                    frame: CGRect(origin:
                                    CGPoint(
                                        x: CGFloat(j) * sizeSquare.width,
                                        y: CGFloat(i) * sizeSquare.height),
                                  size: sizeSquare))
                
                chessboard.addSubview(square)
                
                square.backgroundColor = (i + j) % 2 == 0 ? .white : .black

                if square.backgroundColor == .black {
                    square.tag = 1
                } else {
                    square.tag = 0
                }
                
                square.numberCell = currentNumberCell
                
                let currentColor: CheckerImage = (i + j) % 2 == 0 ? .whiteChecker : .blackChecker
                
                let checker = Checker(checkerNumberCell: currentNumberCell,
                                      checkerImage: currentColor.rawValue,
                                      size: sizeChecker)
                
                guard currentColor == .blackChecker, currentLineForChecker.contains(i) else { continue }
                
                let currentChecker = checker.createChecker(checkerImage: i < 3 ? .blackChecker : .whiteChecker, size: sizeChecker)
                                
                square.addSubview(currentChecker)
                currentChecker.center = checkerCenter

                createGestureRecognizer().forEach { currentChecker.addGestureRecognizer($0) }
            }
        }
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
        guard let checker = sender.view, let square = checker.superview, let board = square.superview else { return }
        
        switch sender.state {
        case.began:
            board.bringSubviewToFront(square)
        case.changed:
            let translation = sender.translation(in: board)
            checker.center = CGPoint(x: checker.center.x + translation.x, y: checker.center.y + translation.y)
            sender.setTranslation(.zero, in: board)
            
        case.ended:
            var newSquare: UIView?
            for view in board.subviews {
                if view.frame.contains(sender.location(in: board)), view.subviews.isEmpty, view.tag == 1 {
                    newSquare = view
                    break
                }
            }
            
            guard let newSquare = newSquare else {
                UIView.animate(withDuration: 0.5, delay: 0,
                               usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn)
                {
                    checker.center = CGPoint(x: square.bounds.width / 2.0, y: square.bounds.height / 2)
                }
                return
            }
            
            newSquare.addSubview(checker)
            
            checker.center = CGPoint(x: square.bounds.width / 2.0, y: square.bounds.height / 2)
            checker.tag = newSquare.hashValue
        default: break
        }
    }
}

extension Chessboard: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}