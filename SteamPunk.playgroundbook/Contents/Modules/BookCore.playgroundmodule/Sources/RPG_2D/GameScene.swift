//
//  GameScene.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/15.
//

import Foundation
import SpriteKit
class GameScene: SKScene {//未使用
    
}
//https://www.hackingwithswift.com/read/11/5/collision-detection-skphysicscontactdelegate
extension GameScene:SKPhysicsContactDelegate{
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
    }
    func didBegin(_ contact: SKPhysicsContact) {//原本做ncp觸碰檢測但取消到touchesBegan in LiveViewController
        
    }
}
//碰撞檢測設定步驟：
//1.新增場景代理SKPhysicsContactDelegate
//2.設定self.physicsWorld.contactDelegate = self
//3.設定接觸拋事件ground.physicsBody?.contactTestBitMask = horseCategory

/*
 ground.physicsBody?.categoryBitMask = landCategory
 ground.physicsBody?.contactTestBitMask = birdCategory
 ground.physicsBody?.collisionBitMask = birdCategory
 文件中的解釋分別是：
 1.一個標記，定義了這個物體所屬分類
 2.一個標記，定義了哪種物體接觸到該物體，該物體會收到通知（誰撞我我會收到通知）
 3.一個標記，定義了哪種物體會碰撞到自己
 第二種是用來丟擲接觸訊息的，第三種是用來檢測碰撞的。碰撞檢測，預設所有物體之間互相可碰撞。接觸訊息，預設所有物體接觸都不產生訊息，這樣是為了保證效率。當你對某種接觸感興趣時，單獨設定contactCategory，監聽這類碰撞訊息。
 */
