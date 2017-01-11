//
//  ViewController.swift
//  Observer
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let staff1 = Staff()
        let staff2 = StaffA()
        let staff3 = StaffB()
        let reception = Reception()
        reception.observers = [staff1, staff2, staff3]
        //公司员工123都关注前台小妹的通知，当老板快要进办公室时，小妹会通知所有人
        reception.noticeLev1()//老板到公司门口了，小妹发通知
        /*
         员工Observer.Staff说：老板来了就来了呗，一直在专心工作
         员工Observer.StaffA说：不怕，继续看动画。
         员工Observer.StaffB说：赶紧关了，打开Xcode。
         */
        reception.noticeLev2()//老板进办公室了，小妹发通知
        /*
         员工Observer.Staff说：老板来了就来了呗，一直在专心工作
         员工Observer.StaffA说：不怕，我是老板侄儿，他不会骂我的。
         员工Observer.StaffB说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

