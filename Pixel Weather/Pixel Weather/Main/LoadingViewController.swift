//
//  LoadingViewController.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 26.07.2023.
//

import UIKit
import CoreLocation

class LoadingViewController: UIViewController {
    
    let loadingBackgroundImage = UIImageView()
    let nameView = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        startTransition()
    }
}

extension LoadingViewController {
    func style() {
        loadingBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        nameView.translatesAutoresizingMaskIntoConstraints = false
        
        if let font = UIFont(name: "Minecraft", size: 48) {
            nameView.font = font
        }
        nameView.text = "Pixel Weather"
        nameView.textColor = .white
    }
    
    func layout() {
        view.addSubview(loadingBackgroundImage)
        view.addSubview(nameView)
        
        NSLayoutConstraint.activate([
            loadingBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            loadingBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        loadingBackgroundImage.image = UIImage(named: "WelcomeBackground")
        
        NSLayoutConstraint.activate([
            nameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
    
    func startTransition() {

        let waitDuration: TimeInterval = 1.0
    
        DispatchQueue.main.asyncAfter(deadline: .now() + waitDuration) { [weak self] in
            guard let self = self else { return }
            
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            mainViewController.view.backgroundColor = UIColor(patternImage: self.loadingBackgroundImage.image ?? UIImage())
            self.present(mainViewController, animated: false, completion: {
                self.view.removeFromSuperview()
            })
        }
    }
}
