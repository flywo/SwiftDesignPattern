//
//  Iterator.swift
//  Iterator
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//定义了一个算法，利用迭代器后，会依次输出结果
struct Algorithm {
    var index: Int
}

//定义了该算法的迭代器
struct AlgorithmIterator: IteratorProtocol {
    
    private var current = 1
    var begin: Int
    
    init(begin: Int) {
        self.begin = begin
    }
    mutating func next() -> Algorithm? {
        defer {
            current += 1
        }
        return Algorithm(index: current * begin)
    }
}

//扩展了该算法，增加一个迭代器方法
extension Algorithm: Sequence {
    func makeIterator() -> AlgorithmIterator {
        return AlgorithmIterator(begin: index)
    }
}


