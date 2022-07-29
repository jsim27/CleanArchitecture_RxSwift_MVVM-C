//
//  SceneFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class SceneFlowCoordinator: Coordinator<Void> {

    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        let navigationController = UINavigationController()
        let tabBarController = UITabBarController()
        let mainTabBarFlowCoordinator = MainTabBarFlowCoordinator(
            navigationController: navigationController,
            tabBarController: tabBarController
        )
        
        self.activate(childCoordinator: mainTabBarFlowCoordinator)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
