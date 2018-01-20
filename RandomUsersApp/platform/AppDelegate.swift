//
//  AppDelegate.swift
//  RandomUsersApp
//
//  Created by Maria Donet Climent on 20/1/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Constants
    
    let storyboardName = "Main"
    
    var window: UIWindow?
    
    lazy var rootConnector: UsersListConnector = {
        let entityGateway = UserRepository(remoteDS: RemoteDataSource(randomService: RandomUserService()))
        return UsersListConnector(entityGateway: entityGateway)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = initializeInitialVC() as! UINavigationController
        let rootVC = navigationController.topViewController
        rootConnector.assembleModule(view: rootVC as! UsersTableViewController)
        setUpWindow(viewController: navigationController)
        return true
    }
    
    private func initializeInitialVC() -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    
    private func setUpWindow(viewController: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

