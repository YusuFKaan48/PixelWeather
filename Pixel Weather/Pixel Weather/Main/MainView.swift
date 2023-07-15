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
    let glassCard = UIStackView()
    let testText = UILabel()
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
        
        glassCard.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)
        glassCard.layer.cornerRadius = 16
        
        if let font = UIFont(name: "Minecraft", size: 32) {
            todayWeather.font = font
        }
        todayWeather.text = "Today's weather"
        todayWeather.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 12) {
            testText.font = font
        }
        testText.text = "Test"
        testText.textColor = .white
    }
    
    func layout() {
        addSubview(mainBackgroundImage)
        addSubview(glassCard)
        addSubview(todayWeather)
        glassCard.addArrangedSubview(testText)
        addSubview(bottomView)
       
        mainBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        glassCard.translatesAutoresizingMaskIntoConstraints = false
        todayWeather.translatesAutoresizingMaskIntoConstraints = false
        testText.translatesAutoresizingMaskIntoConstraints = false
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
            glassCard.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 16),
            glassCard.widthAnchor.constraint(equalToConstant: 329),
            glassCard.heightAnchor.constraint(equalToConstant: 170),
            glassCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            glassCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
           ])
        
        NSLayoutConstraint.activate([
            todayWeather.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            todayWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            todayWeather.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            testText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            testText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}

