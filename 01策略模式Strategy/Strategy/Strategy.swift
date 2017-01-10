//
//  Strategy.swift
//  Strategy
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import Foundation
import UIKit

protocol CashBase {
    //所有计算都要遵循该协议，实现该方法
    func acceptCash(cash: CGFloat) -> CGFloat
}


//正常
class CashNormal: CashBase {
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash
    }
}


//打折
class CashRobate: CashBase {
    
    var moneyRebate: CGFloat
    
    init(rebate: CGFloat) {
        moneyRebate = rebate
    }
    
    func acceptCash(cash: CGFloat) -> CGFloat {
        return moneyRebate * cash
    }
}


//减免
class CashReturn: CashBase {
    
    var moneyReturn: CGFloat
    
    init(retur: CGFloat) {
        moneyReturn = retur
    }
    
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash - moneyReturn
    }
}


enum CashType {
    case Normal
    case Robate
    case Return
}

class CashContext {
    
    var cashBase: CashBase
    
    init(type: CashType) {
        switch type {
        case .Normal:
            cashBase = CashNormal()
        case .Robate:
            cashBase = CashRobate(rebate: 0.5)
        case .Return:
            cashBase = CashReturn(retur: 10)
        }
    }
    
    func getResult(money: CGFloat) -> CGFloat {
        return cashBase.acceptCash(cash: money)
    }
}
