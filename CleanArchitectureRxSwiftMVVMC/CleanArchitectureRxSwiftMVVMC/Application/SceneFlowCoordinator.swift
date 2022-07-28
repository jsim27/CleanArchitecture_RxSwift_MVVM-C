//
//  SceneFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class SceneFlowCoordinator: ParentCoordinator {

    var childCoordinators: [UUID: ChildCoordinator]
    private var window: UIWindow

    init(window: UIWindow) {
        self.childCoordinators = [:]
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        let tabBarController = UITabBarController()
        let mainTabBarFlowCoordinator = MainTabBarFlowCoordinator(
            navigationController: navigationController,
            tabBarController: tabBarController
        )
        mainTabBarFlowCoordinator.parentCoordinator = self
        mainTabBarFlowCoordinator.start()
        self.childCoordinators[mainTabBarFlowCoordinator.id] = mainTabBarFlowCoordinator
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func childCoordinator<T>(
        withIdentifier id: UUID,
        didResignActiveWith result: T
    ) {
        self.childCoordinators.removeValue(forKey: id)
    }
}
