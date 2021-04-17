//
//  DialogBox.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/17.
//

import Foundation
import SpriteKit
class DialogBox{
    let view:SKScene
    let text:[String]
    var sw:Bool = false//是否對話過
    init(view:SKScene,text:[String]) {
        self.view=view
        self.text=text
    }
    func run()->Bool {
        if !sw {
            sw=true //告知已經點擊過
            printLine(textData: text, i: 0)
        }
        return true
    }
    private func printLine(textData:[String],i:Int)
    {
        let text = SKLabelNode(text:textData[i])
        let tall = SKSpriteNode(color: .white, size: CGSize(width: view.size.width-400, height: 100))
        text.fontColor = .black
        tall.position = CGPoint(x: 0, y: -view.size.height/2+100)
        text.position = CGPoint(x: 0, y: -view.size.height/2+100)
        self.view.addChild(tall)
        self.view.addChild(text)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {//倒數一秒下一步
            timer in
            tall.removeFromParent()
            text.removeFromParent()
            if i < textData.count-1{
                self.printLine(textData: textData, i: i+1)
            }
        }
    }
}
