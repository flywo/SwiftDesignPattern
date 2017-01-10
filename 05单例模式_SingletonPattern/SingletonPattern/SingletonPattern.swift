//
//  SingletonPattern.swift
//  SingletonPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class SingleOnce {
    
    static let shared = SingleOnce()
    //将init方法私有化，这样外部就只有使用shared方法获得单例对象
    private init() {}
}
