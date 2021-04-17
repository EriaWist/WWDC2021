//#-hidden-code
//
import SpriteKit
import BookCore //這裡記得要import
reset()
//#-end-hidden-code
let productList = [1]
let NeedToBringList = [1]

for i in NeedToBringList.indices{ //i我們代表看到物品在清單上是第幾個
    for j in productList.indices { //代表
        if NeedToBringList[i] == productList[j] {
            checkBuy(productNumber: j)
        }
    }
}
//就像我們想要買漢堡 我們會在想者漢堡 (就像NeedToBringList[i]) 再販賣機(productList[j])尋找 漢堡 當發現清單上的漢堡跟商品一樣 我們會購買那項商品checkBuy
//#-hidden-code
//

//#-end-hidden-code
