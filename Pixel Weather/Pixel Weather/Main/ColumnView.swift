//
//  ColumnView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import UIKit

class ColumnView: UIView {
    
    let hStack = UIStackView()
    let vStack = UIStackView()
    var logo: String
    var name: String
    var value: String
    let nameLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        self.logo = ""
        self.name = ""
        self.value = ""
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColumnView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        hStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        hStack.spacing = 8
        hStack.alignment = .center
        
        vStack.spacing = 8
        vStack.alignment = .leading
        
        if let font = UIFont(name: "Minecraft", size: 12) {
            nameLabel.font = font
        }
        nameLabel.text = name
        nameLabel.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 24) {
            valueLabel.font = font
        }
        valueLabel.text = value
        valueLabel.textColor = .white
                
        backgroundColor = .white
        layer.cornerRadius = 50
        clipsToBounds = true
    }
    
    func layout() {
        addSubview(hStack)
        hStack.addArrangedSubview(UIImageView(image: UIImage(systemName: logo)))
        hStack.addArrangedSubview(vStack)
        
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: hStack.leadingAnchor, constant: 8),
            vStack.topAnchor.constraint(equalTo: hStack.topAnchor, constant: 8),
            vStack.trailingAnchor.constraint(equalTo: hStack.trailingAnchor, constant: -8),
            vStack.bottomAnchor.constraint(equalTo: hStack.bottomAnchor, constant: -8),
        ])

        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(valueLabel)
    }
}
