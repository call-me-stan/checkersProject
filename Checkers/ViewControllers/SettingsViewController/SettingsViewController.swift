//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Станислав Гусев on 19.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrowView: UIView!
    @IBOutlet weak var arrowImageView: UIImageView!
    private var animation: CABasicAnimation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currentTheme()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        currentTheme()
    }

    private func setupUI() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ThemeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ThemeTableViewCell")
    }
    
    private func currentTheme() {
        if Settings.shared.darkTheme == true {
           self.view.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
            arrowImageView.tintColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
        } else {
            self.view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8980392157, alpha: 1)
            arrowImageView.tintColor = #colorLiteral(red: 0.5294117647, green: 0.5490196078, blue: 0.6666666667, alpha: 1)
        }
    }
    
    private func setAnimation() {
        animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation?.toValue = view.frame.origin.x - arrowView.frame.origin.x + arrowView.frame.size.width + 8.0
        animation?.autoreverses = true
        animation?.repeatCount = .infinity
        animation?.fillMode = .both
        animation?.duration = 1.0
        animation?.beginTime = CACurrentMediaTime()
        animation?.timingFunction = .easeOut
        animation?.isRemovedOnCompletion = false
        
        if let animation = animation {
            arrowView.layer.add(animation, forKey: animation.description)
        }
    }
    @IBAction func backToMenu(_ sender: Any) {
        guard let vc = MenuViewController.getInstanceViewController as? MenuViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 1
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.row {
//        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeTableViewCell") as? ThemeTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
//        default: return UITableViewCell()
//        }
    }
}
