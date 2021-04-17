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

class LiveViewController: UIViewController {
    @IBOutlet var myView: SKView!
    var rpg:RPG_SKView?
    let npc = SKSpriteNode(imageNamed: "NPC-1")
    var dialog:DialogBox?=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        rpg=RPG_SKView(view: myView, protagonistName: "npc")
        rpg?.setBackgroundImage(backgroundImageName: "Butcher-Banker",wallY: 100)
        npc.anchorPoint = CGPoint(x: 0.5, y: 0)
        npc.position=CGPoint(x: 200, y: 100)
        npc.size=CGSize(width: 100, height: 200)
        dialog=DialogBox(view: rpg!.gameScene, text: ["哈哈","Hi"])
        rpg?.addNPC(npc: npc)
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
                        self.dialog?.run()
                    }
                }
            }
        }
    }
}
