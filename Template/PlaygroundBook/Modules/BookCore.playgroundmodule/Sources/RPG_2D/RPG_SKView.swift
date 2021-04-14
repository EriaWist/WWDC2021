//
//  RPG_SKView.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/15.
//

import Foundation
import SpriteKit
class RPG_SKView {
    let protagonist:SKSpriteNode //主角
    let skScene:SKScene //裝載場景
    let view:SKView //裝載SKView 在StoryBoard拉到ViewController然後傳入
    
    
    init(view:SKView,protagonistName:String) {
        self.view = view
        skScene=SKScene(size: view.bounds.size)
        skScene.scaleMode = .aspectFill
        skScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        protagonist = SKSpriteNode(imageNamed: protagonistName)
        protagonist.anchorPoint=CGPoint(x: 0.5,y: 0)
    }
    
    func setBackgroundImage(backgroundImageName:String) {
        let backgroundImage=SKSpriteNode(imageNamed: backgroundImageName) //背景圖
        skScene.addChild(backgroundImage)
    }
    
    func run() {
        skScene.addChild(protagonist)
        view.presentScene(skScene)
    }
    func moveProtagonist(x:CGFloat,y:CGFloat) {
        protagonist.position.x=x
        protagonist.position.y=y
    }
    
}

//npc.anchorPoint = CGPoint(x: 0.5, y: 0.5)
