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
    var gameScene:SKScene?=nil
    var tick:[SKNode]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameScene=SKScene(size: CGSize(width:page2SKView.bounds.size.width/2, height: page2SKView.bounds.size.height))
        if let gameScene = gameScene{
            gameScene.anchorPoint = CGPoint(x: 0.5,y: 0.5)
            gameScene.scaleMode = .resizeFill
            let vendingMachine = SKSpriteNode(imageNamed: "vendingMachine")
            gameScene.addChild(vendingMachine)
            page2SKView.presentScene(gameScene)
            // Do any additional setup after loading the view.
            let product = [[CGPoint(x: -82,y: 185),CGPoint(x: -10,y: 185),CGPoint(x: 62,y: 185)],
                        [CGPoint(x: -82,y: 110),CGPoint(x: -10,y: 110),CGPoint(x: 62,y: 110)],
                        [CGPoint(x: -82,y: 35),CGPoint(x: -10,y: 35),CGPoint(x: 62,y: 35)]]
            for i in product{
                for j in i {
                    let tick = SKSpriteNode(imageNamed: "Tick")
                    tick.anchorPoint=CGPoint(x: 0.5, y: 0.5)
                    tick.size = CGSize(width: 50, height: 50)
                    tick.position = j
                    tick.isHidden=true
                    self.tick.append(tick)
                    gameScene.addChild(tick)
                }
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let datax = touch.location(in: gameScene!).x
            let datay = touch.location(in: gameScene!).y
            let sx = String(format: "%.3f", Double(datax))
            let sy = String(format: "%.3f", Double(datay))
            let text = SKLabelNode(text:"x為\(sx)   y為\(sy)")
            let tall = SKSpriteNode(color: .white, size: CGSize(width: 1000, height: 100))
            text.fontColor = .black
            tall.position = CGPoint(x: 0, y: -(gameScene?.size.height)!/2+100)
            text.position = CGPoint(x: 0, y: -(gameScene?.size.height)!/2+100)
            gameScene?.addChild(tall)
            gameScene?.addChild(text)
        }
        
        
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
            tick[num].isHidden=false
        case .string(let str):
            if str=="all" {
                for i in tick {
                    i.isHidden=true
                }
            }
        default: break

        }

    }
}

