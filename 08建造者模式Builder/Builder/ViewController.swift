//
//  ViewController.swift
//  Builder
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = LabelBuilder(text: "按钮", color: .orange, rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30))
        //通过自定义标签的表示，用同一个构造方法构建标签
        let label = LabelDirector.creatLableWithBuilder(builder: builder)
        view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

