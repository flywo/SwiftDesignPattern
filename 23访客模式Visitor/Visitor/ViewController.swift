//
//  ViewController.swift
//  Visitor
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //分别创建出朋友
        let friends: [FriendProtocol] = [FriendA(), FriendB(), FriendC(), FriendD()]
        //每个朋友都去访问
        let visitors = friends.map{ (friend: FriendProtocol) -> Visitor in
            let visitor = Visitor()
            //访问过后，自己的数据就变了
            friend.accept(vistor: visitor)
            return visitor
        }
        print(dump(visitors))
        /*
         ▿ 4 elements
         ▿ Visitor.Visitor #0
         - address: "访问了朋友A"
         ▿ Visitor.Visitor #1
         - address: "访问了朋友B"
         ▿ Visitor.Visitor #2
         - address: "访问了朋友C"
         ▿ Visitor.Visitor #3
         - address: "访问了朋友D"
         [Visitor.Visitor, Visitor.Visitor, Visitor.Visitor, Visitor.Visitor]
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

