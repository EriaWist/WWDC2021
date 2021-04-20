//
//  Page2Support.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/5.
//

import Foundation
import UIKit
import PlaygroundSupport
import SpriteKit
public func instantiatePage2View() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "Page2", bundle: nil)
    
    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }
    
    guard let liveViewController = viewController as? Page2ViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }
    
    
    return liveViewController
}
public func checkBuy(productId:Int) {//寫在這讓main可以使用
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.integer(productId))//enum可以取值
}
public func reset()
{
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string("all"))//enum可以取值
    trueData=0
}
public func lookNext()
{
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
        proxy.send(.string("next"))//enum可以取值
    trueData+=1
    sleep(1)
}
var trueData = 0
public func getTrueData()->Int{
    return trueData
}
public func goToNextPage()
{
    PlaygroundPage.current.assessmentStatus = .pass(message: "Great! You buy the tou need!\n [Exit vendingMachine](@next)")
}
