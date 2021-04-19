//
//  Ch2Page2ViewController.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/18.
//

import Foundation
//
//  Page2ViewController.swift
//  BookCore
//
//  Created by 阿騰 on 2021/4/5.
//

import UIKit
import SpriteKit
import PlaygroundSupport
class Ch2Page2ViewController: UIViewController {
    @IBOutlet var page2SKView: SKView!
    var MuList = [String]()
    var gameScene:SKScene?=nil//螢幕
    var morseCode = SKSpriteNode(imageNamed: "Morse code")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameScene=SKScene(size: CGSize(width:page2SKView.bounds.size.width/2, height: page2SKView.bounds.size.height))
        if let gameScene = gameScene{
            gameScene.anchorPoint = CGPoint(x: 0.5,y: 0.5)
            gameScene.scaleMode = .aspectFit
            morseCode.size=gameScene.size
            gameScene.addChild(morseCode)
            page2SKView.presentScene(gameScene)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playMu(i: 0)
    }
    func playMu(i:Int) {
        if i<MuList.count {
            let playMuAc = SKAction.playSoundFileNamed("\(MuList[i]).mp3",waitForCompletion:true)
            morseCode.run(playMuAc){
                self.playMu(i:i+1)
            }
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
extension Ch2Page2ViewController:PlaygroundLiveViewMessageHandler{
    func receive(_ message: PlaygroundValue) {
        switch message {
        case .string(let str):
            let underFive = "A"..."Z"//rang
            let uppercasedStr = str.uppercased()//轉大寫
            if underFive.contains(uppercasedStr) && str.count==1 {//比對是否在A...Z的Rang裡 以及是不是為一個字
                MuList.append(uppercasedStr)//加入
            }
            else if(str == "play")
            {
                playMu(i: 0)
            }else if(str == "restar"){
                MuList=[]
            }
        
        default: break
        }
        
    }
}

