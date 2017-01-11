//
//  Builder.swift
//  Builder
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation
import UIKit

//创建对象需要的表示，需要用户自己定制
struct LabelBuilder {
    
    var text: String
    var color: UIColor
    var rect: CGRect
}


class LabelDirector {
    
    //对象的构建，需要传入表示
    static func creatLableWithBuilder(builder: LabelBuilder) -> UILabel {
        
        let label = UILabel(frame: builder.rect)
        label.text = builder.text
        label.textColor = builder.color
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }
}

