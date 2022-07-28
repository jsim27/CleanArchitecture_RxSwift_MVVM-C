//
//  Coordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/28.
//

import Foundation

protocol ChildCoordinator: AnyObject {
    typealias ID = UUID

    var id: ID { get }
    var parentCoordinator: ParentCoordinator? { get set }

    func start()
}

protocol ParentCoordinator: AnyObject {

    var childCoordinators: [UUID: ChildCoordinator] { get set }

    func childCoordinator<T>(
        withIdentifier id: ChildCoordinator.ID,
        didResignActiveWith result: T
    )
}

protocol Coordinator: ChildCoordinator, ParentCoordinator { }
