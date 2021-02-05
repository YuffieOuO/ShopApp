//
//  ProductInformation.swift
//  ShopAPP
//
//  Created by mac on 2021/2/5.
//

import SwiftUI

struct ProductInformation: View {
    let animal: Animal
    let i = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", ]
    var body: some View {
        VStack{
            Text(animal.species)
                .font(.largeTitle)
                .frame(height: 15)
                .padding()
            ScrollView {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipped()
                    .border(Color.black)
                
                List {
                    ForEach(i, id: \.self) {
                        Text("\($0)")
                            .font(.title3)
                    }
                }
            }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
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
        }.border(Color.red)
    }
}

struct ProductInformation_Previews: PreviewProvider {
    static var previews: some View {
        ProductInformation(animal: Animal(imageName: "cat5", species: "Cat", price: "1000"))
    }
}
