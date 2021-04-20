//#-hidden-code
//
import SpriteKit
import BookCore //這裡記得要import
reset()
//#-end-hidden-code

/*:
 # Arrary,for and if
\
 **Story：** Eria was standing in front of the vending machine, looking at the list in her hand and comparing them one by one.
 * Callout(說明):
We can look at the code below
\
think, usually when we go out to buy something,
\
we look at the memo one by one and compare it with what we see in the memo.
 
 **Target：**
 \
 1 Please open the "**Step Through My Code**" execution
 \
 2 Watcher's Code and Followers Code thinking
 - Example:
 We want to buy "Coffee", "Umbrella", "Cups" today
 \
 We may think of Coffee (like NeedToBringList[i])
 \
 first and look for it in the store (productList[j])
 \
 Compare them one by one (if NeedToBringList[i] == productList[j])
 \
 Buy her when you find her (checkBuy(productId: j))
 \
 Not found, see the next (lookNext())
 \
 we will look for Umbrella
 \
 Next, Cups
 */

let productList = ["Book","Morse Code List","Water","Bread","Clothes","egg","Coffee","Umbrella","Cups"] // List of products on the vending machine
let NeedToBringList = ["Morse Code List","Coffee","Bread","Water"]  //List of items to buy

for i in NeedToBringList.indices{ //Variable i is the id of items we see on the list
    for j in productList.indices { //The variable J represents the id of products in the vending machine
        if NeedToBringList[i] == productList[j] {//Compare products with the list
            checkBuy(productId: j)//When buying goods at the same time id
        }
        lookNext()//See the next product
    }
}

//#-hidden-code
//
//就像我們想要買漢堡 我們會在想者漢堡 (就像NeedToBringList[i]) 再販賣機(productList[j])尋找 漢堡 當發現清單上的漢堡跟商品一樣 我們會購買那項商品(checkBuy)
//可以直接執行觀看上面程式運行時的樣貌
if (getTrueData() >= NeedToBringList.count)
{
    goToNextPage()
}
//#-end-hidden-code
