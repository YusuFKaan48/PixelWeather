//
//  CardView.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 15.07.2023.
//

import UIKit
import CoreLocation

class CardView: UIView {
    
    let glassCard = UIStackView()
    let firstColumn = UIStackView()
    let secondColumn = UIStackView()
    let columnView1 = ColumnView()
    let columnView2 = ColumnView()
    let columnView3 = ColumnView()
    let columnView4 = ColumnView()

    var weather: ResponseBody?
    let locationManager = CLLocationManager()
   
    override init(frame: CGRect) {
        self.weather = previewWeather
        super.init(frame: frame)
        
        style()
        layout()
        setupLocationManager()
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
        firstColumn.spacing = 2
        
        secondColumn.axis = .horizontal
        secondColumn.alignment = .top
    
        
        columnView1.nameLabel.text = "Min temp"
        if let tempMin = weather?.main.tempMin {
            columnView1.valueLabel.text = "\(tempMin.rounded(toPlaces: 1))°"
        } else {
            columnView1.valueLabel.text = "--°"
        }

        columnView2.nameLabel.text = "Max temp"
        if let tempMax = weather?.main.tempMax {
            columnView2.valueLabel.text = "\(tempMax.rounded(toPlaces: 1))°"
        } else {
            columnView2.valueLabel.text = "--°"
        }

        columnView3.nameLabel.text = "Wind speed"
        if let windSpeed = weather?.wind?.speed {
            columnView3.valueLabel.text = "\(windSpeed.rounded(toPlaces: 1)) km/s"
        } else {
            columnView3.valueLabel.text = "-- km/s"
        }

        columnView4.nameLabel.text = "Humidity"
        if let humidity = weather?.main.humidity {
            columnView4.valueLabel.text = "\(humidity.rounded(toPlaces: 1))%"
        } else {
            columnView4.valueLabel.text = "--%"
        }

        columnView1.logoImageView.image = UIImage(named: "Min-black")
        columnView2.logoImageView.image = UIImage(named: "Max-black")
        columnView3.logoImageView.image = UIImage(named: "Wind-black")
        columnView4.logoImageView.image = UIImage(named: "Humidity-black")
        
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
    
    func setupLocationManager() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
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
                    }
                } catch {
                    print("Error decoding weather data: \(error)")
                }
            }.resume()
        }
    
    private func updateWeatherData() {
            if let tempMin = weather?.main.tempMin {
                columnView1.valueLabel.text = "\(tempMin.rounded(toPlaces: 1))°"
            } else {
                columnView1.valueLabel.text = "--°"
            }

            if let tempMax = weather?.main.tempMax {
                columnView2.valueLabel.text = "\(tempMax.rounded(toPlaces: 1))°"
            } else {
                columnView2.valueLabel.text = "--°"
            }

            if let windSpeed = weather?.wind?.speed {
                columnView3.valueLabel.text = "\(windSpeed.rounded(toPlaces: 1)) km/s"
            } else {
                columnView3.valueLabel.text = "-- km/s"
            }

            if let humidity = weather?.main.humidity {
                columnView4.valueLabel.text = "\(humidity.rounded(toPlaces: 1))%"
            } else {
                columnView4.valueLabel.text = "--%"
            }
        }
    }

extension CardView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        fetchWeatherData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}

