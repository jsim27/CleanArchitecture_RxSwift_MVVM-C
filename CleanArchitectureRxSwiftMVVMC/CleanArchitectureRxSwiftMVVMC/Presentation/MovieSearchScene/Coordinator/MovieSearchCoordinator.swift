//
//  MovieSearchCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class MovieSearchCoordinator: Coordinator {

    var parentCoordinator: ParentCoordinator?
    var childCoordinators: [ChildCoordinator]
    private var navigationController: UINavigationController
    private var tabBarController: UITabBarController
    private var page: TabBarPage

    init(navigationController: UINavigationController, tabBarController: UITabBarController, page: TabBarPage) {
        self.childCoordinators = []
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.page = page
    }

    func start() {
        let movieSearchViewController = MovieSearchViewController()
        self.tabBarController.setViewControllers([movieSearchViewController], animated: false)
        movieSearchViewController.tabBarItem = UITabBarItem(
            title: self.page.title,
            image: self.page.image,
            tag: self.page.index
        )
        movieSearchViewController.view.backgroundColor = .white
    }

    func childCoordinator(
    _ childCoordinator: ChildCoordinator,
    didResignActiveWith result: CoordinationResult
    ) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
