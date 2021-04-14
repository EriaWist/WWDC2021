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
    override func viewDidLoad() {
        super.viewDidLoad()
        rpg=RPG_SKView(view: myView, protagonistName: "npc")
        rpg?.setBackgroundImage(backgroundImageName: "Butcher-Banker")
        rpg?.run()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in touches{
            let location = i.location(in: rpg!.skScene)
            rpg!.moveProtagonist(x: location.x, y: location.y)
        }
    }
    
}
