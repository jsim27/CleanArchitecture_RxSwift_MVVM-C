//
//  MainTabBarFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class MainTabBarFlowCoordinator: Coordinator {

    var id: ID
    var parentCoordinator: ParentCoordinator?
    var childCoordinators: [UUID: ChildCoordinator]
    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.id = UUID()
        self.childCoordinators = [:]
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
        self.childCoordinators[movieSearchCoordinator.id] = movieSearchCoordinator

    }

    func childCoordinator<T>(withIdentifier id: UUID, didResignActiveWith result: T) {
    }

}
