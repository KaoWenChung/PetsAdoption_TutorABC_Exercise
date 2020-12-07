//
//  AppDelegate.swift
//  PetsAdoption_TutorABC_Exercise
//
//  Created by wyn on 2020/11/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let navigationController = UINavigationController()
        let mainViewController = MainViewController()
        navigationController.viewControllers = [mainViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = .white
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()

        return true
    }
}

