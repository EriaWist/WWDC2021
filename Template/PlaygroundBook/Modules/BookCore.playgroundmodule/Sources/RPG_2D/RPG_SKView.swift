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
    var wallY:CGFloat?=nil
    
    init(view:SKView,protagonistName:String) {
        self.view = view
        skScene=SKScene(size: view.bounds.size)
        skScene.scaleMode = .aspectFill
        skScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        protagonist = SKSpriteNode(imageNamed: protagonistName)
        protagonist.anchorPoint=CGPoint(x: 0.5,y: 0)
    }
    
    func setBackgroundImage(backgroundImageName:String,wallY:CGFloat) {
        self.wallY=wallY
        let backgroundImage=SKSpriteNode(imageNamed: backgroundImageName) //背景圖
        skScene.addChild(backgroundImage)//添加背景
    }
    
    func addNPC(npc:SKSpriteNode) {
        skScene.addChild(npc)//加上npc
    }
    
    func run() {
        skScene.addChild(protagonist)
        view.presentScene(skScene)
    }
    func moveProtagonist(x:CGFloat,y:CGFloat) {
        if (wallY == nil || wallY!>y){
            protagonist.run(SKAction.stop())//停下動畫
            let panAction = SKAction.moveBy(x: x-protagonist.position.x, y: y-protagonist.position.y, duration: 1)//移動
            protagonist.run(panAction)//跑動畫
        }
    }
    
}

//npc.anchorPoint = CGPoint(x: 0.5, y: 0.5)
