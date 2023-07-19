//
//  CardView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import UIKit

class CardView: UIView {
    
    let glassCard = UIStackView()
    let firstColumn = UIStackView()
    let secondColumn = UIStackView()
    let columnView1 = ColumnView()
    let columnView2 = ColumnView()
    let columnView3 = ColumnView()
    let columnView4 = ColumnView()
    
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
        glassCard.translatesAutoresizingMaskIntoConstraints = false
        
        glassCard.axis = .vertical
        glassCard.spacing = 4
        
        glassCard.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)
        glassCard.layer.cornerRadius = 16
        
        firstColumn.axis = .horizontal
        firstColumn.alignment = .top
        
        secondColumn.axis = .horizontal
        secondColumn.alignment = .top
        
        columnView1.nameLabel.text = "Name 1"
        columnView1.valueLabel.text = "Value 1"
        
        columnView2.nameLabel.text = "Name 2"
        columnView2.valueLabel.text = "Value 2"
        
        columnView3.nameLabel.text = "Name 3"
        columnView3.valueLabel.text = "Value 3"
        
        columnView4.nameLabel.text = "Name 4"
        columnView4.valueLabel.text = "Value 4"
        
        columnView1.logoImageView.image = UIImage(named: "Thermometer")
        columnView2.logoImageView.image = UIImage(named: "Thermometer")
        columnView3.logoImageView.image = UIImage(named: "Thermometer")
        columnView4.logoImageView.image = UIImage(named: "Thermometer")
        
    }
    
    func layout() {
        addSubview(glassCard)
        glassCard.addArrangedSubview(firstColumn)
        glassCard.addArrangedSubview(secondColumn)
        firstColumn.addArrangedSubview(columnView1)
        firstColumn.addArrangedSubview(columnView2)
        secondColumn.addArrangedSubview(columnView3)
        secondColumn.addArrangedSubview(columnView4)
        
        NSLayoutConstraint.activate([
                    glassCard.topAnchor.constraint(equalTo: topAnchor),
                    glassCard.leadingAnchor.constraint(equalTo: leadingAnchor),
                    glassCard.trailingAnchor.constraint(equalTo: trailingAnchor),
                    glassCard.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
    }
}
