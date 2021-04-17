//
//  observer.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/17.
//

import Foundation

class Observer{
    static var updataFuncArr:[String:[()->()]]=[:]//一個被觀測者key會搭配多個觀測者的updata
    static func addUpdataFunc(id:String,updata: @escaping()->())//@escaping 是告訴swift這個閉包要在這個func外使用
    {
        if updataFuncArr[id]==nil {
            updataFuncArr[id]=[] //當字典的陣列是空的
        }
        updataFuncArr[id]?.append {
            updata()
        }
    }
    static func callUpdata(id:String)
    {
        if updataFuncArr[id]==nil {
            print("Error")//假如是空的
            return
        }
        for updataFunc in updataFuncArr[id]!{
            updataFunc()
        }
    }
}
