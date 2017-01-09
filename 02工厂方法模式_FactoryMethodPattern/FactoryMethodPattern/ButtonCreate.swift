//
//  ButtonCreate.swift
//  FactoryMethodPattern
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation
import UIKit

class ButtonCreate {

    func createButton(title: String, rect: CGRect) -> UIButton? {
        
        print("子类：\(String(describing: self)) 未实现创建方法！")
        return nil
    }
}

//创建矩形按钮
class SquareButtonCreate: ButtonCreate {
    
    override func createButton(title: String, rect: CGRect) -> UIButton? {
        
        let btn = UIButton(frame: rect)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.layer.borderWidth = 1
        return btn
    }
}

//创建圆角按钮
class RoundButtonCreate: ButtonCreate {
    
    override func createButton(title: String, rect: CGRect) -> UIButton? {
        
        let btn = UIButton(frame: rect)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.layer.borderWidth = 1
        return btn
    }
}
