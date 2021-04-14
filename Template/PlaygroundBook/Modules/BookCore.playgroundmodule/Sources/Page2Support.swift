//
//  Page2Support.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/5.
//

import Foundation
import UIKit
import PlaygroundSupport
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
