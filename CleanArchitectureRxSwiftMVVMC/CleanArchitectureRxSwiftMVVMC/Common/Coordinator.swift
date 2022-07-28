//
//  Coordinator.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/28.
//

import Foundation

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }

    func start()
}
