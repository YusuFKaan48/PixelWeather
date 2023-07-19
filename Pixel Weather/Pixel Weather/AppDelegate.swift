//
//  AppDelegate.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 10.07.2023.
//

import UIKit
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let locationManager = LocationManager()
   
    var window: UIWindow?
     
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = WelcomeViewController()
   //    window?.rootViewController = MainViewController()
        
        return true
    }
}
