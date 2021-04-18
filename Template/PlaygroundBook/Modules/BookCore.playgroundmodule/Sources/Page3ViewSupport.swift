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
