//#-hidden-code
//
import SpriteKit
import BookCore //這裡記得要import
reset()
//#-end-hidden-code
let productList = [1,2,3,4,5,6,7,8,9] // 商品列表
let NeedToBringList = [1,3,7,5,9,2]  //需要購買的物品清單

for i in NeedToBringList.indices{ //i我們代表看到物品在清單上是第幾個
    for j in productList.indices { //j代表是第幾項商品
        if NeedToBringList[i] == productList[j] {//當商品跟清單上的商品是否一樣
            checkBuy(productNumber: j)//一樣時購買商品
        }
        lookNext()//查看下一個商品
    }
}
//就像我們想要買漢堡 我們會在想者漢堡 (就像NeedToBringList[i]) 再販賣機(productList[j])尋找 漢堡 當發現清單上的漢堡跟商品一樣 我們會購買那項商品(checkBuy)
//可以直接執行觀看上面程式運行時的樣貌
//#-hidden-code
//
if (getTrueData() >= NeedToBringList.count)
{
    goToNextPage()
}
//#-end-hidden-code
