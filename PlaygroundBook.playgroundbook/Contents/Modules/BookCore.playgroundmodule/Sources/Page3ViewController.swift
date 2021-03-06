//
//  Page3ViewController.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/18.
//

import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport
class Page3ViewController: UIViewController {
    @IBOutlet var myView: SKView!
    var rpg:RPG_SKView?
    let wall = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 150, height: 50))
    let vendingMachine = SKSpriteNode(imageNamed: "vendingMachine")
    var isTall = false
    var dialog:DialogBox?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        rpg=RPG_SKView(view: myView, protagonistName: "npc",x: -200,y: -200)
        rpg?.setBackgroundImage(backgroundImageName: "Butcher-Banker-1",wallY: 100)
        vendingMachine.size = CGSize(width: 150, height: 200)
        vendingMachine.anchorPoint=CGPoint(x: 0.5,y: 0)
        vendingMachine.position = CGPoint(x: -280, y: -190)
        let elevator = SKSpriteNode(imageNamed: "elevator")
        elevator.size = CGSize(width: 800, height: 400)
        elevator.anchorPoint=CGPoint(x: 0.5,y: 0.5)
        elevator.position = CGPoint(x: 0, y: 20)
        wall.position=CGPoint(x: 50, y: 160)
        rpg?.addNPC(npc: wall)
        rpg?.addNPC(npc: elevator)
        rpg?.addNPC(npc: vendingMachine)
        rpg?.run()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //點擊螢幕
        if let touch = touches.first {
            let datax = touch.location(in: rpg!.gameScene).x
            let datay = touch.location(in: rpg!.gameScene).y
            let text = SKLabelNode(text:"x is \(Int(datax))   y is \(Int(datay))")
            let tall = SKSpriteNode(color: .white, size: CGSize(width: 1000, height: 100))
            text.fontColor = .black
            tall.position = CGPoint(x: 0, y: -(rpg?.gameScene.size.height)!/2+100)
            text.position = CGPoint(x: 0, y: -(rpg?.gameScene.size.height)!/2+100)
            rpg?.gameScene.addChild(tall)
            rpg?.gameScene.addChild(text)
        }
        
        //                if let touch = touches.first
        //                {
        //                    let location = touch.location(in: rpg!.gameScene)
        //                    if let rpg = self.rpg  {
        //                        if runingsw{
        //                            rpg.moveProtagonist(x: location.x, y: location.y){
        //                                if self.wall.intersects(rpg.protagonist)
        //                                {
        //                                    PlaygroundPage.current.assessmentStatus = .pass(message: "Go to the next level\n [Next Page](@next)")
        //                                    self.runingsw = false
        //                                }
        //                            }
        //                        }
        //                    }
        //                }
        
        
    }
}
extension Page3ViewController:PlaygroundLiveViewMessageHandler{
    func receive(_ message: PlaygroundValue) {
        switch message {
        case .array(let arr):
            switch arr[0] {
            case .integer(let x):
                switch arr[1] {
                case .integer(let y):
                    if let rpg = self.rpg  {
                        rpg.moveProtagonist(x: CGFloat(x), y: CGFloat(y)){
                            if self.wall.intersects(rpg.protagonist)
                            {
                                PlaygroundPage.current.assessmentStatus = .pass(message: "Go to the next level\n [Next Page](@next)")
                                
                            }
                        }
                        
                    }
                default:
                    break
                }
            default:
                break
            }
        default:
            break
        }
    }
}
