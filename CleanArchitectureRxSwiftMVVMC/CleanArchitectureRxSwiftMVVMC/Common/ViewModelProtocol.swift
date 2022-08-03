//
//  ViewModelProtocol.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/08/03.
//

import Foundation

protocol ViewModelProtocol: AnyObject {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
