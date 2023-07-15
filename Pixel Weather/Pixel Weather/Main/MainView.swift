//
//  MainView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 11.07.2023.
//

import Foundation
import UIKit

class MainView: UIView {
    
    let mainBackgroundImage = UIImageView()
    let todayWeather = UILabel()
    let cardView = CardView()
    let bottomView = BottomView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let font = UIFont(name: "Minecraft", size: 32) {
            todayWeather.font = font
        }
        todayWeather.text = "Today's weather"
        todayWeather.textColor = .white
    }
    
    func layout() {
        addSubview(mainBackgroundImage)
        addSubview(todayWeather)
        addSubview(cardView)
        addSubview(bottomView)
       
        mainBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        todayWeather.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainBackgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainBackgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainBackgroundImage.topAnchor.constraint(equalTo: topAnchor),
            mainBackgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        mainBackgroundImage.image = UIImage(named: "Variations-4")
        mainBackgroundImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            todayWeather.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            todayWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            todayWeather.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}

