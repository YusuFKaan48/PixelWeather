//
//  AppDelegate.swift
//  Pixel Weather
//
//  Created by Yusuf Kaan USTA on 10.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.value(forKey: "appLaunchedBefore") == nil {
            UserDefaults.standard.setValue(true, forKey: "appLaunchedBefore")
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            window?.rootViewController = WelcomeViewController()
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .systemBackground
            window?.rootViewController = LoadingViewController()
        }
        return true
    }
}

