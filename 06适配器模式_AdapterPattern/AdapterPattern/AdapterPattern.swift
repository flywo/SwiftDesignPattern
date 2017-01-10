//
//  AdapterPattern.swift
//  AdapterPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//车子，如果想要开着，那肯定得是人，但是某一天，一个条狗也在开车，那么狗想开车，怎么办呢，这时候，适配器模式就出现了。
class Car {
    
    var driver: Person
    
    init(driver: Person) {
        self.driver = driver
    }
    
    func driverShow() {
        print("\(driver.name)用\(driver.foot)在开车")
    }
    
}

struct Person {
    
    var foot: String
    var name: String
    
    static func say() {
        print("我会说话！")
    }
}

struct Dog {
    
    var leg: String
    var name: String
    
    static func say() {
        print("汪汪汪")
    }
}

//适配器
struct DogAdpter {
    //将一个对象适配成另外一个对象
    static func adapterDog(dog: Dog) -> Person {
        let person = Person(foot: dog.leg, name: dog.name)
        return person
    }
}

class Talk {
    
    static func talk(obj: AnyObject) {
        
        if obj is Person {
            Person.say()
        }else if obj is Dog {
            Dog.say()
        }
    }
}

