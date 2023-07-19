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
        
        columnView1.nameLabel.text = "Min temp"
        columnView1.valueLabel.text = "7°"
        
        columnView2.nameLabel.text = "Max temp"
        columnView2.valueLabel.text = "17°"
        
        columnView3.nameLabel.text = "Wind speed"
        columnView3.valueLabel.text = "4 m/s"
        
        columnView4.nameLabel.text = "Humidity"
        columnView4.valueLabel.text = "%33"
        
        columnView1.logoImageView.image = UIImage(named: "Min")
        columnView2.logoImageView.image = UIImage(named: "Max")
        columnView3.logoImageView.image = UIImage(named: "Wind")
        columnView4.logoImageView.image = UIImage(named: "Humidity")
        
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
