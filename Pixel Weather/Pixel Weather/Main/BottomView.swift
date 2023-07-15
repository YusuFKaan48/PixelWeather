//
//  BottomView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import Foundation
import UIKit

class BottomView: UIView {
    
    let bottomStackView = UIStackView()
    let weatherState = UILabel()
    let degreeState = UILabel()
    let dateState = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 8
        
        if let font = UIFont(name: "Minecraft", size: 36) {
            weatherState.font = font
        }
        weatherState.text = "Tokyo is Snowy"
        weatherState.textColor = .init(red: 199/255, green: 86/255, blue: 80/255, alpha: 1.0)
        
        if let font = UIFont(name: "Minecraft", size: 36) {
            degreeState.font = font
        }
        degreeState.text = "15°"
        degreeState.textColor = .init(red: 199/255, green: 86/255, blue: 80/255, alpha: 1.0)
        
        if let font = UIFont(name: "Minecraft", size: 24) {
            dateState.font = font
        }
        dateState.text = "Dec 1"
        dateState.textColor = .init(red: 199/255, green: 86/255, blue: 80/255, alpha: 1.0)
    }
    
    func layout() {
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(weatherState)
        bottomStackView.addArrangedSubview(degreeState)
        bottomStackView.addArrangedSubview(dateState)
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherState.translatesAutoresizingMaskIntoConstraints = false
        degreeState.translatesAutoresizingMaskIntoConstraints = false
        dateState.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
}

