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
    let gameScene:SKScene //裝載場景
    let view:SKView //裝載SKView 在StoryBoard拉到ViewController然後傳入
    var wallY:CGFloat?=nil
    
    init(view:SKView,protagonistName:String,x:CGFloat,y:CGFloat) {
        self.view = view
        gameScene=GameScene(size: view.bounds.size)
        gameScene.scaleMode = .aspectFit
        gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        protagonist = SKSpriteNode(imageNamed: protagonistName)
        protagonist.anchorPoint=CGPoint(x: 0.5,y: 0)
        protagonist.size=CGSize(width: 130, height: 200)
        protagonist.position=CGPoint(x: x, y: y)
        protagonist.physicsBody = SKPhysicsBody(rectangleOf: protagonist.size)//創建物理引擎
        protagonist.physicsBody?.affectedByGravity=false//使物體不再掉落
        protagonist.physicsBody?.allowsRotation=false //物體不會選轉
//        protagonist.physicsBody?.isDynamic = false //靜態不被撞動 靜態 為了被牆擋住不設定
       
    }
    
    func setBackgroundImage(backgroundImageName:String,wallY:CGFloat) {
        self.wallY=wallY
        let backgroundImage=SKSpriteNode(imageNamed: backgroundImageName) //背景圖
        backgroundImage.size=view.bounds.size
        backgroundImage.blendMode = .replace//.replace選項的意思是“只繪製它，忽略任何alpha值”
        backgroundImage.zPosition = -1//zPosition為-1，這在我們的遊戲中意味著“將其拖到其他所有東西後面”。
//        let size = gameScene.size
//        let leftWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 1, height: size.height))
//        leftWall.position = CGPoint(x:size.height/2, y: size.width)
//        leftWall.physicsBody = SKPhysicsBody(rectangleOf: leftWall.size)
//        leftWall.physicsBody!.isDynamic = false
//        gameScene.addChild(leftWall)
//
//        let rightWall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 1, height: size.height))
//        rightWall.position = CGPoint(x: size.width/2, y: 0)
//        rightWall.physicsBody = SKPhysicsBody(rectangleOf: rightWall.size)
//        rightWall.physicsBody!.isDynamic = false
//        gameScene.addChild(rightWall)
        gameScene.addChild(backgroundImage)//添加背景
        /*
        我們將為其提供混合模式.replace。混合模式確定如何繪製節點，SpriteKit提供了許多選項。該.replace選項的意思是“只繪製它，忽略任何alpha值”，這可以快速處理沒有背景的東西，例如我們的背景。我們還將背景設置zPosition為-1，這在我們的遊戲中意味著“將其拖到其他所有東西後面”。
         */
    }
    
    func addNPC(npc:SKNode) {
        gameScene.addChild(npc)//加上npc
    }
    
    func run() {//執行這個故事
        gameScene.addChild(protagonist)
        view.presentScene(gameScene)
    }
    func moveProtagonist(x:CGFloat,y:CGFloat,completionFunc:@escaping ()->Void) {
        if (wallY == nil || wallY!>y){
            protagonist.run(SKAction.stop())//停下動畫
            let panAction = SKAction.move(to:CGPoint(x: x, y: y), duration: 1)//移動
            protagonist.run(panAction){
                completionFunc()//完成後執行內容
            }//跑動畫
        }
    }
    
}

//npc.anchorPoint = CGPoint(x: 0.5, y: 0.5)
