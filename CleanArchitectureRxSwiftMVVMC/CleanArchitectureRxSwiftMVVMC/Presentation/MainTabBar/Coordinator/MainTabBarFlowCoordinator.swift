//
//  MainTabBarFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class MainTabBarFlowCoordinator: Coordinator {

    var parentCoordinator: ParentCoordinator?
    var childCoordinators: [ChildCoordinator]
    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.childCoordinators = []
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }

    func start() {
        self.tabBarController.setViewControllers([], animated: false)
        self.navigationController.viewControllers = [self.tabBarController]
        self.activateMovieSearchCoordinator()
    }

    private func activateMovieSearchCoordinator() {
        let movieSearchCoordinator = MovieSearchCoordinator(
            navigationController: self.navigationController,
            tabBarController: self.tabBarController,
            page: .movieSearch
        )
        movieSearchCoordinator.parentCoordinator = self
        movieSearchCoordinator.start()
        self.childCoordinators.append(movieSearchCoordinator)

    }

    func childCoordinator(
        _ childCoordinator: ChildCoordinator,
        didResignActiveWith result: CoordinationResult
    ) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }

}
