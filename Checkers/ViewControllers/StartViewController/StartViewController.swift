//
//  ViewController.swift
//  Checkers
//
//  Created by Станислав Гусев on 23.01.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var enterYourNameView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var helloLabel: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var enterYourNameTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ifPlayerHasName()
        
        navigationController?.navigationBar.isHidden = true
        
        setupUI()
        currentTheme()
        scrollView.delegate = self
        startAnimation()
        buttonIsActive()
    }
    
    private func currentTheme() {
        if Settings.shared.theme == .dark {
            backgroundImage.image = UIImage(named: "screen_black_ipad.jpg")
        } else {
            backgroundImage.image = UIImage(named: "screen_ipad.jpg")
        }
    }
    
    private func ifPlayerHasName() {
        if (UserDefaults.standard.object(forKey: "firsthPlayerNameLabel") as? String) != nil {
            guard let vc = MenuViewController.getInstanceViewController as? MenuViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else {
            return
        }
    }
    
    private func setupUI() {
        enterYourNameView.alpha = 0
        
        logoImageView.alpha = 0
        helloLabel.alpha = 0
        pageControl.alpha = 0
        doneButton.isEnabled = false
    }
    
    @IBAction func doneButton(_ sender: Any) {
        guard let vc = MenuViewController.getInstanceViewController as? MenuViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        
        vc.player = enterYourNameTextField
    }
    
    
    private func startAnimation() {
        firsthStartAnimation()
    }
    
    private func firsthStartAnimation() {
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       options: [.curveEaseInOut]) {
            self.logoImageView.alpha = 1.0
            self.helloLabel.alpha = 1.0
            self.pageControl.alpha = 1.0
        }
    }
    
    private func showEnterYourNameView() {
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseInOut]) {
            self.enterYourNameView.alpha = 1.0
        }
    }
    
    private func buttonIsActive() {
        enterYourNameTextField.addTarget(self, action: #selector(conditionButton), for: .editingChanged)
    }
    
    @objc private func conditionButton() {
        if enterYourNameTextField.text?.count ?? 0>0 {
            UserDefaults.standard.set("\(enterYourNameTextField.text ?? "")", forKey: "firsthPlayerNameLabel")
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
}


extension StartViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let onePageOffset = scrollView.contentSize.width / CGFloat(pageControl.numberOfPages)
        let diffScale = (scrollView.contentOffset.x / onePageOffset) * 0.1
        
        guard diffScale <= 0.1 else {
            let newAlpha = 1 - ((scrollView.contentOffset.x / onePageOffset) - 1)
            pageControl.alpha = newAlpha
            return
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let onePageOffset = scrollView.contentSize.width / CGFloat(pageControl.numberOfPages)
        pageControl.currentPage = Int(scrollView.contentOffset.x / onePageOffset)
        
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            showEnterYourNameView()
        }
    }
    
    
}
