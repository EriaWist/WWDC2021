//
//  Ch2Page2ViewSupport.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/18.



import Foundation
import UIKit
import PlaygroundSupport
import SpriteKit
public func instantiateCh2Page2View() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "Ch2Page2", bundle: nil)
    
    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }
    
    guard let liveViewController = viewController as? Ch2Page2ViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }
    
    
    return liveViewController
}
public func addWord(Char:Character){
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string(String(Char)))//enum可以取值
}
public func playMu(){
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string("play"))//enum可以取值
}
public func restar(){
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string("restar"))//enum可以取值
}



