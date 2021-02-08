//
//  ShoppingCart.swift
//  ShopAPP
//
//  Created by mac on 2021/2/2.
//

import SwiftUI

struct ShoppingCart: View {
    @State private var creditCardNumber1 = ""
    @State private var creditCardNumber2 = ""
    @State private var creditCardNumber3 = ""
    @State private var creditCardNumber4 = ""
    var body: some View {
        VStack{
            HStack{
                TextField("0", text: $creditCardNumber1)
                    .frame(width: 20, height: 30, alignment: .center)
                TextField("0", text: $creditCardNumber2)
                    .frame(width: 20, height: 30, alignment: .center)
                TextField("0", text: $creditCardNumber3)
                    .frame(width: 20, height: 30, alignment: .center)
                TextField("0", text: $creditCardNumber4)
                    .frame(width: 20, height: 30, alignment: .center)
            }
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
