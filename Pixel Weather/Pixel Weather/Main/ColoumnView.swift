//
//  ColoumnView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 17.07.2023.
//

import UIKit

class ColumnView: UIView {
    
    let hStack = UIStackView()
    let vStack = UIStackView()
    let logoImageView = UIImageView()
    let nameLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        hStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        hStack.spacing = 8
        hStack.axis = .horizontal

        vStack.spacing = 6
        vStack.axis = .vertical
        
        nameLabel.font = UIFont(name: "Minecraft", size: 12)
        nameLabel.textColor = .black
         
        valueLabel.font = UIFont(name: "Minecraft", size: 20)
        valueLabel.textColor = .black
        
    }
    
    func layout() {
        addSubview(hStack)
        hStack.addArrangedSubview(logoImageView)
        hStack.addArrangedSubview(vStack)
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.widthAnchor.constraint(equalToConstant: 42).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
        
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(valueLabel)
    }

}
