//
//  AbstractFactory.swift
//  AbstractFactory
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//产品
protocol ProductProtocol {
    var factory: String { get set }
    func showYouself()
}


struct Television: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的电视")
    }
}


struct Refrigerator: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的冰箱")
    }
}


//工厂
enum ProductType {
    case Television, Refrigerator
}


class Factory {
    static func createProduct(type: ProductType) -> ProductProtocol {
        switch type {
        case .Television:
            return Television(factory: "工厂")
        default:
            return Refrigerator(factory: "工厂")
        }
    }
}
