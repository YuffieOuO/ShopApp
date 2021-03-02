//
//  ProductInformation.swift
//  ShopAPP
//
//  Created by mac on 2021/2/5.
//

import SwiftUI

struct ProductInformation: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let animal: Animal
    let i = ["商品", "數量", "價格", "地區", "重量", "介紹","文字", "文字", "文字", "文字", "文字"]
    let j = ["貓", "1", "1000","台灣", "4KG", "...", "...", "...", "...", "...", "...", ]
    var body: some View {
        VStack{
            HStack{
                Text(animal.species)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .overlay(
                        ShoppingCartButton(),alignment: .trailing)
                    .overlay(
                        ReturnButton(),alignment: .leading)
                
            }.frame(maxWidth: .infinity, maxHeight: 50)
            .padding(5)
            
            ScrollView {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipped()
                VStack{
                    HStack{
                        Text("商品")
                            .frame(width: 100, height: 40)
                        Text(animal.species)
                            .font(.title3)
                            .frame(width: 100, height:40)
                        
                    }
//                    .border(Color.black)
                }
//                .border(Color.blue)
            }.padding(.horizontal, 10.0)
//            .border(Color.black)
            
            HStack{
                Spacer()
                Button(action: {
                    
                }) {
                    Text("加入購物車")
                        .font(.title2)
                        .padding(.trailing, 10)
                }
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}


struct ProductInformation_Previews: PreviewProvider {
    static var previews: some View {
        ProductInformation(animal: Animal(imageName: "cat5", species: "Cat", price: "1000"))
        //        WidgetView()
    }
}
