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
    let i = ["商品", "數量", "地區", "重量", "大小", "介紹","文字", "文字", "文字", "文字", "文字"]
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text(animal.species)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .overlay(
                        NavigationLink(destination: ShoppingCart()){
                            Image("basket").resizable().frame(width: 50, height: 50)
                        },alignment: .trailing)
                    .overlay(
                        Button(action : {
                            mode.wrappedValue.dismiss()
                        }){
                            Image("arrow-direction-left-way-backword-previous-51-28597").resizable().frame(width: 50, height: 50)
                        },alignment: .leading)
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
            .padding(5)
            
            ScrollView {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipped()
                
                HStack(alignment:.top){
                    VStack{
                        ForEach(i, id: \.self) {
                            Text("\($0)")
                                .font(.title3)
                                .frame(width: 100, height:40)
                        }
                    }
                    Spacer()
                    VStack{
                        ForEach(i, id: \.self) {
                            Text("\($0)")
                                .font(.title3)
                                .frame(width: 100, height:40)
                        }
                    }
                }
            }.padding(.horizontal, 10.0)
            
            HStack{
                Spacer()
                Button(action: {
                    //                    Alert
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
    }
}
