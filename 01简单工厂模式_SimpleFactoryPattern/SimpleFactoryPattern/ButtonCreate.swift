//
//  ButtonCreate.swift
//  SimpleFactoryPattern
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ButtonCreate {

    //使用该类方法创建按钮，只需要传入按钮的title,rect,showBorder（其中showBorder默认为true），即可得到一个按钮
    static func createButton(title: String, rect: CGRect, showBorder: Bool = true) -> UIButton {
        
        let btn = UIButton(frame: rect)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        
        if showBorder {
            btn.layer.cornerRadius = 5
            btn.layer.borderColor = UIColor.orange.cgColor
            btn.layer.borderWidth = 1
        }
        return btn
    }

}
