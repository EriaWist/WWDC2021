//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  A source file which is part of the auxiliary module named "BookCore".
//  Provides the implementation of the "always-on" live view.
//


//

import UIKit
import SpriteKit
import GameplayKit
import PlaygroundSupport
class LiveViewController: UIViewController {
    @IBOutlet var myView: SKView!
    var rpg:RPG_SKView?
    let npc = SKSpriteNode(imageNamed: "NPC-1")
    let vendingMachine = SKSpriteNode(imageNamed: "vendingMachine")
    var isTall = false
    var dialog:DialogBox?=nil
    let arrowR = SKSpriteNode(imageNamed: "arrowR")
    override func viewDidLoad() {
        super.viewDidLoad()
        rpg=RPG_SKView(view: myView, protagonistName: "npc",x: -270,y: -200)
        rpg?.setBackgroundImage(backgroundImageName: "Butcher-Banker",wallY: 100)
        npc.anchorPoint = CGPoint(x: 0.5, y: 0)
        npc.position=CGPoint(x: 0, y: 100)
        npc.size=CGSize(width: 200, height: 200)
        arrowR.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        arrowR.position=CGPoint(x: -100, y: 200)
        arrowR.size=CGSize(width: 100, height: 50)
        vendingMachine.size = CGSize(width: 150, height: 200)
        vendingMachine.position = CGPoint(x: 250, y: -50)
        dialog=DialogBox(view: rpg!.gameScene, text: ["Hi Eria","Are you going to that special event today?","This list is for you to go and buy the things on it","Task Tips : Past Vending Machines"])
        rpg?.addNPC(npc: arrowR)
        rpg?.addNPC(npc: npc)
        rpg?.addNPC(npc: vendingMachine)
        rpg?.run()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {//點擊螢幕
        if let touch = touches.first
        {
            let location = touch.location(in: rpg!.gameScene)
            if let rpg = self.rpg {
                rpg.moveProtagonist(x: location.x, y: location.y){
                    if self.npc.intersects(rpg.protagonist)
                    {
                        self.arrowR.removeFromParent()
                        self.isTall=((self.dialog?.run()) != nil)
                        let arrowD = SKSpriteNode(imageNamed: "arrowD")
                        arrowD.size = CGSize(width: 50, height: 100)
                        arrowD.position = CGPoint(x: 250, y: 100)
                        rpg.addNPC(npc: arrowD)
                        
                        
                    }else if(self.vendingMachine.intersects(rpg.protagonist) && self.isTall)
                    {
                        PlaygroundPage.current.assessmentStatus = .pass(message: "")
                        PlaygroundPage.current.navigateTo(page: .next)
                    }
                }
                
            }
   
            
        }
    }
}
