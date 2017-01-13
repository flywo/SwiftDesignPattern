//
//  Interpreter.swift
//  Interpreter
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//定义一种新的语法，用字符表示，解释"1+2"这个字符串的含义

protocol Interpreter {
    //返回一个泛型Result
    static func interpreter<Result>(input: String) -> Result
}

//整型解释器
struct IntInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (Int(arr.first!)! + Int(arr.last!)!) as! Result
    }
}

//字符解析器
struct StringInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (arr.first! + arr.last!) as! Result
    }
}
