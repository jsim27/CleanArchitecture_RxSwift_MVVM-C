//
//  TabBarPage.swift
//  CleanArchitectureRxSwiftMVVMC
//
//  Created by Jae-hoon Sim on 2022/07/29.
//

import UIKit

enum TabBarPage {
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
}
