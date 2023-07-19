//
//  BottomView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import Foundation
import UIKit
import CoreLocation

class BottomView: UIView {
    
    let locationManager = CLLocationManager()
    
    var weather: ResponseBody

    let bottomStackView = UIStackView()
    let weatherState = UILabel()
    let degreeState = UILabel()
    let dateState = UILabel()
    
    override init(frame: CGRect) {
        self.weather = previewWeather
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
        weatherState.text = "\(weather.name) is \(weather.weather[0].main)"
        weatherState.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 36) {
            degreeState.font = font
        }
        degreeState.text = (weather.main.feelsLike.roundDouble() + "°")
        degreeState.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 24) {
            dateState.font = font
        }
        dateState.text = Date().formatted(.dateTime.month().day())
        dateState.textColor = .white
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
        ])
    }
}
