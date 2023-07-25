//
//  BottomView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import UIKit
import CoreLocation

class BottomView: UIView {
    let locationManager = CLLocationManager()
    var weather: ResponseBody?
    
    let bottomStackView = UIStackView()
    let weatherState = UILabel()
    let degreeState = UILabel()
    let dateState = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        setupLocationManager()
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
        
        if let font = UIFont(name: "Minecraft", size: 28) {
            weatherState.font = font
        }
        weatherState.text = "Loading weather data..."
        weatherState.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 28) {
            degreeState.font = font
        }
        degreeState.text = "--°"
        degreeState.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 18) {
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
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getWeather() -> ResponseBody? {
            return weather
        }
    
    private func handleWeatherResponse(_ weatherData: ResponseBody) {
            self.weather = weatherData
            (superview as? MainView)?.setWeatherBackground()
        }

}

extension BottomView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
    
    private func fetchWeatherData(latitude: Double, longitude: Double) {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=eb16ede3d55a7e6c5feddd19bbe1881a&units=metric") else { return }
            
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let self = self else { return }
                
                if let error = error {
                    print("Error getting weather data: \(error)")
                    return
                }
                
                guard let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Error while fetching data")
                    return
                }
                
                do {
                    let weatherData = try JSONDecoder().decode(ResponseBody.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = weatherData
                        self.updateWeatherData()
                        self.handleWeatherResponse(weatherData)
                    }
                } catch {
                    print("Error decoding weather data: \(error)")
                }
            }.resume()
        }

    private func updateWeatherData() {
        guard let weather = weather else { return }
        
        weatherState.text = "\(weather.name) is \(weather.weather[0].main)"
        degreeState.text = "\(weather.main.feelsLike.roundDouble())°"
        dateState.text = Date().formatted(.dateTime.month().day())
    }
}
