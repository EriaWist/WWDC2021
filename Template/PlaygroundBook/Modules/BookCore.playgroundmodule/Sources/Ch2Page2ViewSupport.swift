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
var dataAns = [Character]()
public func addWord(Char:Character){
    dataAns.append(Char)
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string(String(Char)))//enum可以取值
}
let outData = """
    addWord(Char: "W") \n
    addWord(Char: "W") \n
    addWord(Char: "D") \n
    addWord(Char: "C")
    """
public func playMu(){
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string("play"))//enum可以取
    if (dataAns[0]=="W" || dataAns[0]=="w") && (dataAns[1]=="W" || dataAns[1]=="w") && (dataAns[2]=="D" || dataAns[2]=="d") && (dataAns[3]=="C"||dataAns[3]=="c") {
        PlaygroundPage.current.assessmentStatus = .pass(message: "Great! You have successfully entered the Token to WWDC!\nCongratulations on completing all the content And You can try to listen to other morse code")
    }else{
        PlaygroundPage.current.assessmentStatus = .fail(hints: ["Please play WWDC"], solution: outData)
    }
}
public func restar(){
    dataAns=[]
    let page = PlaygroundPage.current
    let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy //轉換成傳遞訊息的
    proxy.send(.string("restar"))//enum可以取值
}


