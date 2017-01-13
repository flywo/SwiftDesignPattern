//
//  Flyweight.swift
//  Flyweight
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//假设有一家杂货店，一开始老板不知道卖什么，有人来买，马上就制造，进货后就会不会缺货，我们就可以使用享元模式，将有人买过的东西保存起来共享，再有人买直接拿出来就可以，不用再去进新的货。

//商品
struct Commodity: CustomStringConvertible {//CustomStringConvertible该协议能够使自定义输出实例的description
    var commodity: String
    var description: String {
        get {
            return "商品名称："+commodity
        }
    }
}

//杂货店
class GroceryStore {
    //商品列表
    private var list = [String: Commodity]()
    //mutating关键字作用：在方法中修改struct和enum变量，如果不加，会提示无法修改结构体成员
    func buyCommodity(name: String) -> Commodity {
        //无货，制造，制造好后，放到list中共享
        if !list.keys.contains(name) {
            print("没有这个货，给你制造！")
            list[name] = Commodity(commodity: name)
        }else {
            print("有货，直接给你拿！")
        }
        return list[name]!
    }
}
