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
public func check(node:SKNode) {//寫在這讓main可以使用
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.data(node as! Data))//enum可以取值
}
