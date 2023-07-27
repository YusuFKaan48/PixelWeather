//
//  MainView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 11.07.2023.
//

import Foundation
import UIKit
import CoreLocation

class MainView: UIView {
    
    let mainBackgroundImage = UIImageView()
    let todayWeather = UILabel()
    let cardView = CardView()
    let bottomView = BottomView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        setWeatherBackground()
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
            
            
            NSLayoutConstraint.activate([
                todayWeather.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
                todayWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            ])
            
            NSLayoutConstraint.activate([
                cardView.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 16),
                cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                cardView.heightAnchor.constraint(equalToConstant: 170),
                cardView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            ])
            
            NSLayoutConstraint.activate([
                bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                bottomView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                bottomView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
            ])
}
    
    func setWeatherBackground() {
        if let weather = bottomView.getWeather() {
            if let weatherMain = weather.weather.first?.main {
                let weatherCondition = WeatherCondition(rawValue: weatherMain)
                print("Weather data: \(weatherMain)")
                
                switch weatherCondition {
                case .rainy:
                    mainBackgroundImage.image = UIImage(named: "rain")
                case .cloudy:
                    mainBackgroundImage.image = UIImage(named: "cloud")
                case .sunny:
                    mainBackgroundImage.image = UIImage(named: "clear")
                case .snowy:
                    mainBackgroundImage.image = UIImage(named: "snow")
                case .foggy:
                    mainBackgroundImage.image = UIImage(named: "fog")
                case .thunderstorm:
                    mainBackgroundImage.image = UIImage(named: "thunderstorm")
                case .windy:
                    mainBackgroundImage.image = UIImage(named: "wind1")
                case .misty:
                    mainBackgroundImage.image = UIImage(named: "mist")
                case .hazey:
                    mainBackgroundImage.image = UIImage(named: "haze")
                default:
                    mainBackgroundImage.image = UIImage(named: "welcome")
                }
            }
        } else {
            print("Weather data is missing")
          mainBackgroundImage.image = UIImage(named: "welcome")
        }
    }
}

enum WeatherCondition: String, Codable {
    case rainy = "Rain"
    case cloudy = "Clouds"
    case sunny = "Clear"
    case snowy = "Snow"
    case foggy = "Fog"
    case thunderstorm = "Thunderstorm"
    case windy = "Wind"
    case misty = "Mist"
    case hazey = "Haze"
}
