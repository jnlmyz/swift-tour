//
//  Grid.swift
//  Recipe note
//
//  Created by 古我知 純 on 2021/08/10.
//

import SwiftUI

struct Grid: View {
    //$0はクロージャの引数を省略するときに使うコードです。
    let data = Array(1...1000).map{"item \($0)"}
    
    
    //LazyHGridビューとLazyVgridビューのアイテムのレイアウトを構成
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    
    
    
    var body: some View {
        //スクロール
        ScrollView {
            //縦方向に伸びるグリッドに配置し、必要な時だけアイテムを作成するコンテナビュー。spacingでアイテムの間の感覚を決める
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(data, id :\.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)","iPhone XS Max"], id: \.self) { deviceName in
            Grid()
            .previewDevice(PreviewDevice(rawValue: deviceName))
                       .previewDisplayName(deviceName)
        }
    }
}

//https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html


//main()を意識しなくてもよい
//グローバルスコープである
print("Heelo,world")


//型を指定しないときは、コンパイラが型を予測する
var myVariable = 42
myVariable = 50
let myConstant = 42 //定数

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70



let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

shoppingList.append("blue paint")
print(shoppingList)


//イニシャライザ構文
//要素の値の型を指定しているのかな
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]


//Control Flow


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

//for-inでループ
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

//オプショナル型。nilを代入できる
//型は、Optional（"Hello"）
var optionalString: String? = "Hello"


//ifとletを使用して、欠落している可能性のある値を処理できます。

var optionalName: String?
var greeting = "Hello!"

//if let オプショナルを区別することができる。その他の方は区別死しない
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello nil"
}


//Switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"): ////let x where xで変数の値を使用することができる
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
