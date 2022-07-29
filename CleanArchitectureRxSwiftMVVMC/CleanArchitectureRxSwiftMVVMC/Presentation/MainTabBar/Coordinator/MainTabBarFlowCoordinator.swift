//
//  MainTabBarFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class MainTabBarFlowCoordinator: Coordinator<Void> {

    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }

    override func start() {
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
        
        self.activate(childCoordinator: movieSearchCoordinator)
    }
}
