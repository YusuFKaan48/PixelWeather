//
//  CardView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import Foundation
import UIKit

class CardView: UIView {
    
    
    let coloumnView = ColumnView()
    let glassCard = UIStackView()
    let firstColumn = UIStackView()
    let secondColoumn = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        glassCard.translatesAutoresizingMaskIntoConstraints = false
        coloumnView.translatesAutoresizingMaskIntoConstraints = false
        firstColumn.translatesAutoresizingMaskIntoConstraints = false
        secondColoumn.translatesAutoresizingMaskIntoConstraints = false
        
        glassCard.axis = .vertical
        glassCard.spacing = 8
        
        glassCard.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)
        glassCard.layer.cornerRadius = 16
        
        firstColumn.axis = .horizontal
        firstColumn.spacing = 4

        secondColoumn.axis = .horizontal
        secondColoumn.spacing = 4
    }
    
    func layout() {
        addSubview(glassCard)
        glassCard.addArrangedSubview(firstColumn)
        glassCard.addArrangedSubview(secondColoumn)
        
        NSLayoutConstraint.activate([
         glassCard.widthAnchor.constraint(equalToConstant: 329),
         glassCard.heightAnchor.constraint(equalToConstant: 170),
         glassCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
         glassCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
    }
}

