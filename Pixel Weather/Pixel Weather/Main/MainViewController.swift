//
//  MainViewController.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 11.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension MainViewController {
    private func style() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
    }
        private func layout() {
            view.addSubview(mainView)
            
            NSLayoutConstraint.activate([
                        mainView.topAnchor.constraint(equalTo: view.topAnchor),
                        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    ])
        }
}

