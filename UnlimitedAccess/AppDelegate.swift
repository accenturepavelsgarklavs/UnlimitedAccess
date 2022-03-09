//
//  AppDelegate.swift
//  UnlimitedAccess
//
//  Created by pavels.garklavs on 03/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        navigationController = UINavigationController(rootViewController: makeMainController())

        window?.rootViewController = navigationController
        return true
    }

}

private extension AppDelegate {
    func makeMainController() -> UIViewController {
        let mainController = MainViewController()
        let mainViewModel = MainViewModel()

        mainController.configure(mainViewModel: mainViewModel)

        return mainController
    }
}

