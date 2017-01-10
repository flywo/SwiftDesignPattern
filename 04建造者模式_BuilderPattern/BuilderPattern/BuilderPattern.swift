//
//  File.swift
//  BuilderPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation
import UIKit

struct ButtonBuilder {
    
    //按钮的属性
    var title: String
    var titleColorNormal: UIColor//默认orange
    var titleColorSelected: UIColor
    var rect: CGRect
    var isRound: Bool
    var boardColor = UIColor.orange.cgColor
    
    init(title: String, titleColorNormal: UIColor = .orange, titleColorSelected: UIColor = .gray, rect: CGRect, isRound: Bool, boardColor: CGColor = UIColor.orange.cgColor) {
        self.title = title
        self.titleColorNormal = titleColorNormal
        self.titleColorSelected = titleColorSelected
        self.rect = rect
        self.isRound = isRound
        self.boardColor = boardColor
    }
}



class BuilderDirector {
    
    static func createButtonWithBuilder(builder: ButtonBuilder) -> UIButton {
        
        let btn = UIButton(frame: builder.rect)
        btn.setTitle(builder.title, for: .normal)
        btn.setTitleColor(builder.titleColorNormal, for: .normal)
        btn.setTitleColor(builder.titleColorSelected, for: .selected)
        btn.layer.borderColor = builder.boardColor
        btn.layer.borderWidth = 1
        if builder.isRound {
            btn.layer.cornerRadius = 5
        }
        return btn
    }
}
