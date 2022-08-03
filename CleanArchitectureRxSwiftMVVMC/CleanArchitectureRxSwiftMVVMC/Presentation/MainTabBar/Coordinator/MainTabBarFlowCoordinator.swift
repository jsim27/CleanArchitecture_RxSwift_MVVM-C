//
//  MainTabBarFlowCoordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

final class MainTabBarFlowCoordinator: Coordinator<Void> {

    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    init(navigationController: UINavigationController, tabBarController: UITabBarController) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }

    override func start() {
        self.prepareTabBarController()
        self.navigationController.viewControllers = [self.tabBarController]
    }

    private func prepareTabBarController() {
        let viewControllers = Self.TabBarPage.allCases
            .map { $0.getViewController() }
        self.tabBarController.setViewControllers(viewControllers, animated: false)
        self.tabBarController.selectedIndex = 0
        self.tabBarController.tabBar.isTranslucent = false
    }
}

extension MainTabBarFlowCoordinator {

    enum TabBarPage: CaseIterable {
        case movieSearch

        init?(index: Int) {
            switch index {
            case 0:
                self = .movieSearch
            default:
                return nil
            }
        }

        var title: String {
            switch self {
            case .movieSearch:
                return "영화 검색"
            }
        }

        var index: Int {
            switch self {
            case .movieSearch:
                return 0
            }
        }

        var image: UIImage? {
            switch self {
            case .movieSearch:
                return nil
            }
        }

        private func getTabBarItem() -> UITabBarItem {
            return UITabBarItem(title: self.title, image: self.image, tag: self.index)
        }

        func getViewController() -> UIViewController {
            switch self {
            case .movieSearch:
                let vc = MovieSearchViewController()
                vc.tabBarItem = self.getTabBarItem()
                //TODO: - should inject ViewModels
                //TODO: - should inject self as coordinator to ViewModel of each VCs
                return vc
            }
        }
    }
}
