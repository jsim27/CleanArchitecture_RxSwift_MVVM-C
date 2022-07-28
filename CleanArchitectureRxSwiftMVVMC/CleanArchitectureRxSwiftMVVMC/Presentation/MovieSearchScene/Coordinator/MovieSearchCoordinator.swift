//
//  MovieSearchCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

class MovieSearchCoordinator: Coordinator {

    var id: UUID
    var parentCoordinator: ParentCoordinator?
    var childCoordinators: [UUID: ChildCoordinator]
    private var navigationController: UINavigationController
    private var tabBarController: UITabBarController
    private var page: TabBarPage

    init(navigationController: UINavigationController, tabBarController: UITabBarController, page: TabBarPage) {
        self.id = UUID()
        self.childCoordinators = [:]
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

    func childCoordinator<T>(withIdentifier id: UUID, didResignActiveWith result: T) {
        self.childCoordinators.removeValue(forKey: id)
    }
}
