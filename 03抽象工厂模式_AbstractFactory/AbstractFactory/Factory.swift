//
//  Factory.swift
//  AbstractFactory
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class Factory {
    
    //type:电视 冰箱
    func createProduct(type: String) -> Product? {
        
        switch type {
        case "电视":
            return createTV()
        case "冰箱":
            return createFreezer()
        default:
            print("生产不了\(type)")
            return nil
        }
    }
    
    //造电视
    /*关键字含义：
     private:只能当前类访问
     fileprivate:只有当前文件可以访问
     internal:框架内可以访问
     public:任何人可以访问，其它的module不能被重写和继承，本module内可以被重写和继承
     open:可以被任何人使用，包括重写和继承
     */
    fileprivate func createTV() -> Product? {
        
        print("子工厂不会造电视！")
        return nil
    }
    
    //造冰箱
    fileprivate func createFreezer() -> Product? {
        
        print("子工厂不会造冰箱！")
        return nil
    }
}


class AFactory: Factory {
    
    fileprivate override func createTV() -> Product? {
        
        let result = TV()
        result.from = String(describing: self)
        return result
    }
    
    fileprivate override func createFreezer() -> Product? {
        
        let result = Freezer()
        result.from = String(describing: self)
        return result
    }
}


class BFactory: Factory {
    
    fileprivate override func createTV() -> Product? {
        
        let result = TV()
        result.from = String(describing: self)
        return result
    }
    
    fileprivate override func createFreezer() -> Product? {
        
        let result = Freezer()
        result.from = String(describing: self)
        return result
    }
}
