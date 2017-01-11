//
//  Observer.swift
//  Observer
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

enum NoticeType {
    case Lev1 //老板到公司门口了
    case Lev2 //老板进来办公室了
}


protocol ObserverProtocol {
    //定义了一个协议，实现
    func notice(type: NoticeType)
}


//公司前台小妹
final class Reception {
    
    var observers: [ObserverProtocol]?
    
    func noticeLev1() {
        noticeEveryOne(lev: .Lev1)
    }
    
    func noticeLev2() {
        noticeEveryOne(lev: .Lev2)
    }
    
    private func noticeEveryOne(lev: NoticeType) {
        for obj in observers! {
            obj.notice(type: lev)
        }
    }
}


//好员工
class Staff: ObserverProtocol {
    
    func notice(type: NoticeType) {
        print("员工\(String(describing: self))说：老板来了就来了呗，一直在专心工作")
    }
}


//员工a
final class StaffA: Staff {
    
    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：不怕，继续看动画。")
        default:
            print("员工\(String(describing: self))说：不怕，我是老板侄儿，他不会骂我的。")
        }
    }
}


//员工B
final class StaffB: Staff {
    
    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：赶紧关了，打开Xcode。")
        default:
            print("员工\(String(describing: self))说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。")
        }
    }
}
