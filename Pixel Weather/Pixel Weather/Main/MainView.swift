import Foundation
import UIKit

class MainView: UIView {
    
    let mainBackgroundImage = UIImageView()
    let todayWeather = UILabel()
    let glassCard = UIStackView()
    let testText = UILabel()
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

extension MainView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 8
        
        glassCard.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.30)
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
        addSubview(mainBackgroundImage)
        addSubview(glassCard)
        addSubview(todayWeather)
        glassCard.addArrangedSubview(testText)
        addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(weatherState)
        bottomStackView.addArrangedSubview(degreeState)
        bottomStackView.addArrangedSubview(dateState)
       
        mainBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        glassCard.translatesAutoresizingMaskIntoConstraints = false
        todayWeather.translatesAutoresizingMaskIntoConstraints = false
        testText.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherState.translatesAutoresizingMaskIntoConstraints = false
        degreeState.translatesAutoresizingMaskIntoConstraints = false
        dateState.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainBackgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainBackgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainBackgroundImage.topAnchor.constraint(equalTo: topAnchor),
            mainBackgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        mainBackgroundImage.image = UIImage(named: "8.5")
        mainBackgroundImage.contentMode = .scaleAspectFill
           
           NSLayoutConstraint.activate([
            glassCard.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 16),
            glassCard.widthAnchor.constraint(equalToConstant: 329),
            glassCard.heightAnchor.constraint(equalToConstant: 170),
            glassCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            glassCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
           ])
        
        NSLayoutConstraint.activate([
            todayWeather.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 128),
            todayWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            todayWeather.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            testText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            testText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -64),
            bottomStackView.widthAnchor.constraint(equalToConstant: 329),
            bottomStackView.heightAnchor.constraint(equalToConstant: 170),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
}


