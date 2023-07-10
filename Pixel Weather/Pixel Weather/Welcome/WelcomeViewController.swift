//
//  ViewController.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 10.07.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    let welcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension WelcomeViewController {
    private func style() {
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        view.addSubview(welcomeView)
        
        NSLayoutConstraint.activate([
            welcomeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: welcomeView.trailingAnchor, multiplier: 1)
        ])
    }
}
