//
//  Page3ViewSupport.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/18.
//

import Foundation
import UIKit
import PlaygroundSupport
import SpriteKit
public func instantiatePage3View() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "Page3", bundle: nil)
    
    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }
    
    guard let liveViewController = viewController as? Page3ViewController else {//這裡也要改
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }
    
    
    return liveViewController
}
public func moveTo(x:Int,y:Int){
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.array([.integer(x),.integer(y)]))//enum可以取值
}
public func fail(){
    PlaygroundPage.current.assessmentStatus = .fail(hints: ["Click on the elevator to see the x and y and use moveTo to move"], solution: "moveTo(x: 50, y: 50)")
}
