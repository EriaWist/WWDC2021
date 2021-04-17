//#-hidden-code
//
import SpriteKit
let product = [[CGPoint(x: -82,y: 185),CGPoint(x: -10,y: 185),CGPoint(x: 62,y: 185)],
            [CGPoint(x: -82,y: 110),CGPoint(x: -10,y: 110),CGPoint(x: 62,y: 110)],
            [CGPoint(x: -82,y: 35),CGPoint(x: -10,y: 35),CGPoint(x: 62,y: 35)]]
func check(node:SKNode) {

//
    Observer.callUpdata(id:"P2")
}
//#-end-hidden-code
let str = "Hello, playground"
for i in product{
    for j in i {
        let tick = SKSpriteNode(imageNamed: "Tick")
        tick.anchorPoint=CGPoint(x: 0.5, y: 0.5)
        tick.size = CGSize(width: 50, height: 50)
        tick.position = j

    }
}
