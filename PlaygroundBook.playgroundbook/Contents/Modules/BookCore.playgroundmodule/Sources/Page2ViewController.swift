//
//  Page2ViewController.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/5.
//

import UIKit
import SpriteKit
import PlaygroundSupport
class Page2ViewController: UIViewController {
    @IBOutlet var page2SKView: SKView!
    var gameScene:SKScene?=nil//螢幕
    var tick:[SKNode]=[]
    var productCount = 0
    let rightHand = SKSpriteNode(imageNamed: "Right hand")
    let product = [CGPoint(x: -80,y: 170),CGPoint(x: -30,y: 170),CGPoint(x: 20,y: 170),
                   CGPoint(x: -80,y: 110),CGPoint(x: -30,y: 110),CGPoint(x: 20,y: 110),
                   CGPoint(x: -80,y: 60),CGPoint(x: -30,y: 60),CGPoint(x: 20,y: 60)]//販賣機各大座標
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameScene=SKScene(size: CGSize(width:page2SKView.bounds.size.width/2, height: page2SKView.bounds.size.height))
        if let gameScene = gameScene{
            gameScene.anchorPoint = CGPoint(x: 0.5,y: 0.5)
            gameScene.scaleMode = .aspectFit
            let vendingMachine = SKSpriteNode(imageNamed: "vendingMachine")
            gameScene.addChild(vendingMachine)
            page2SKView.presentScene(gameScene)
            
            // Do any additional setup after loading the view.
            for i in product{
                    let tick = SKSpriteNode(imageNamed: "Tick")
                    tick.anchorPoint=CGPoint(x: 0.5, y: 0.5)
                    tick.size = CGSize(width: 50, height: 50)
                    tick.position = i
                    tick.isHidden=true
                    self.tick.append(tick)
                    gameScene.addChild(tick)
            }
            rightHand.size = CGSize(width: 100, height:100)
            rightHand.anchorPoint = CGPoint(x: 0.405, y: 0.8)
            rightHand.position=product[0]
            rightHand.isHidden=true
            gameScene.addChild(rightHand)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//                if let touch = touches.first {                    let datax = touch.location(in: gameScene!).x
//                    let datay = touch.location(in: gameScene!).y
//                    let sx = String(format: "%.3f", Double(datax))
//                    let sy = String(format: "%.3f", Double(datay))
//                    let text = SKLabelNode(text:"x為\(sx)   y為\(sy)")
//                    let tall = SKSpriteNode(color: .white, size: CGSize(width: 1000, height: 100))
//                    text.fontColor = .black
//                    tall.position = CGPoint(x: 0, y: -(gameScene?.size.height)!/2+100)
//                    text.position = CGPoint(x: 0, y: -(gameScene?.size.height)!/2+100)
//                    gameScene?.addChild(tall)
//                    gameScene?.addChild(text)
//                }
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
//https://developer.apple.com/documentation/playgroundsupport/messaging_between_a_playground_page_and_the_always-on_live_view
extension Page2ViewController:PlaygroundLiveViewMessageHandler{
    func receive(_ message: PlaygroundValue) {
        switch message {
        case .integer(let num):
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false){_ in 
                self.tick[num].isHidden=false
            }
            
            break
        case .string(let str):
            if str=="all" {
                for i in tick {
                    i.isHidden=true
                    rightHand.position=product[0]
                    productCount = 0
                    rightHand.isHidden=false
                }
            }
            if str == "next"
            {
                let panAction = SKAction.move(to:product[productCount], duration: 1)//移動
                rightHand.run(panAction)
                if productCount<product.count-1{
                    productCount+=1
                   
                }else{
                    productCount = 0
                }
                
            }
        default: break
            
        }
        
    }
}

