//
//  Coordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/28.
//

import Foundation

protocol ChildCoordinator: AnyObject {

    var parentCoordinator: ParentCoordinator? { get set }

    func start()
}

protocol ParentCoordinator: AnyObject {

    var childCoordinators: [ChildCoordinator] { get set }

    func childCoordinator<CoordinationResult>(
        _ childCoordinator: ChildCoordinator,
        didResignActiveWith result: CoordinationResult?
    )
}

class Coordinator<CoordinationResult>: ChildCoordinator, ParentCoordinator {

    weak var parentCoordinator: ParentCoordinator?
    var childCoordinators: [ChildCoordinator]

    init() {
        self.childCoordinators = []
    }

    func start() {

    }

    func resignActive(with coordinationResult: CoordinationResult?) {
        self.childCoordinators.removeAll()
        self.parentCoordinator?.childCoordinator(
            self,
            didResignActiveWith: coordinationResult
        )
    }

    func childCoordinator<CoordinationResult>(
        _ childCoordinator: ChildCoordinator,
        didResignActiveWith result: CoordinationResult
    ) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
