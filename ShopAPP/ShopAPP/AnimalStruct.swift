import Foundation
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    var imageName, species, price: String
}
//"商品", "數量", "地區", "重量", "大小", "介紹","文字", "文字", "文字", "文字", "文字",
struct Products {
    var productName = ""
    var numberOfProducts = 0
    var location = ""
    var weight = 0
    var volume = 0
    var introduction = ""
    var string1 = ""
    var string2 = ""
    var string3 = ""
    var string4 = ""
    var string5 = ""
}
