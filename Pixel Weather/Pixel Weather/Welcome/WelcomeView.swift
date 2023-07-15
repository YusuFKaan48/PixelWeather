
import Foundation
import UIKit
import CoreLocation

class WelcomeView: UIView {
    
    let welcomeBackgroundImage = UIImageView()
    let stackView = UIStackView()
    let welcomeTitle = UILabel()
    let welcomeParagraph = UILabel()
    let LocationFindButton = UIButton()

    let locationManager = CLLocationManager()
    
    private var originalButtonTransform: CGAffineTransform = .identity
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WelcomeView {
    func style() {
        
        translatesAutoresizingMaskIntoConstraints = false
    
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        
        if let font = UIFont(name: "Minecraft", size: 32) {
            welcomeTitle.font = font
        }
        welcomeTitle.text = "Welcome..."
        welcomeTitle.textColor = .white
        
        if let font = UIFont(name: "Minecraft", size: 16) {
            welcomeParagraph.font = font
        }
        welcomeParagraph.text = "Welcome to the Pixel Weather App. You can see weather with pixel images."
        welcomeParagraph.textColor = .white
        welcomeParagraph.numberOfLines = 0
        
        LocationFindButton.setTitle("Continue", for: .normal)
        LocationFindButton.setTitleColor(.black, for: .normal)
        LocationFindButton.backgroundColor = UIColor(red: 243/255, green: 247/255, blue: 218/255, alpha: 1.0)
        
        let buttonTitleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Minecraft", size: 20) ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black
        ]
        let attributedTitle = NSAttributedString(string: "Continue", attributes: buttonTitleAttributes)
        LocationFindButton.setAttributedTitle(attributedTitle, for: .normal)
        LocationFindButton.layer.cornerRadius = 16
        LocationFindButton.addTarget(self, action: #selector(animateButton), for: .touchUpInside)
        originalButtonTransform = LocationFindButton.transform
    }
    
    func layout() {
        addSubview(welcomeBackgroundImage)
        addSubview(stackView)
        stackView.addArrangedSubview(welcomeTitle)
        stackView.addArrangedSubview(welcomeParagraph)
        addSubview(LocationFindButton)
        
        welcomeBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        LocationFindButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeBackgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeBackgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            welcomeBackgroundImage.topAnchor.constraint(equalTo: topAnchor),
            welcomeBackgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        welcomeBackgroundImage.image = UIImage(named: "9.5")
        welcomeBackgroundImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            LocationFindButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            LocationFindButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            LocationFindButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -120),
            LocationFindButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func findLocationButtonTapped() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
        print("Find location button tapped")
    }
    
    @objc func animateButton() {
        let scaleDownAnimation = {
            self.LocationFindButton.transform = self.originalButtonTransform.scaledBy(x: 0.95, y: 0.95)
        }
        
        let scaleUpAnimation = {
            self.LocationFindButton.transform = self.originalButtonTransform
        }
        
        UIView.animate(withDuration: 0.1, animations: scaleDownAnimation) { _ in
            UIView.animate(withDuration: 0.1, animations: scaleUpAnimation)
        }

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
        print("Find location button tapped")
    }

}

extension WelcomeView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}
