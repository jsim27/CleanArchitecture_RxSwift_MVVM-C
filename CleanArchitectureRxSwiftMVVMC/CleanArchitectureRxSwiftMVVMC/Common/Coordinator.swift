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

    func childCoordinator(
        _ childCoordinator: ChildCoordinator,
        didResignActiveWith result: CoordinationResult
    )
}

protocol Coordinator: ChildCoordinator, ParentCoordinator { }

extension Coordinator {

    func finish() {
        self.childCoordinators.removeAll()
        self.parentCoordinator?.childCoordinator(self, didResignActiveWith: .none)
    }
}

enum CoordinationResult {
    case none
    case integer(Int)
    case string(String)
}
