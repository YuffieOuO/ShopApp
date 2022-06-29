import SwiftUI

struct ContentView: View {
    
//    var request = URLRequest(url: url)
    private let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    //    let animal: Animal
    @State var animal = [
        Animal(imageName: "giftbox", species: "Box", price: "500"),
        Animal(imageName: "giftbox", species: "Box", price: "1000"),
        Animal(imageName: "giftbox", species: "Box", price: "800"),
        Animal(imageName: "giftbox", species: "Box", price: "1200"),
        Animal(imageName: "giftbox", species: "Box", price: "700"),
        Animal(imageName: "giftbox", species: "Box", price: "1500")]
    
    var body: some View {
        NavigationView{
            VStack {
                ShopIcon()
                HStack{
                    VStack(alignment: .leading) {
                        Text("Animal")
                            .frame(width: 60, height: 40)
                            .padding(.leading, 5)
                            .onTapGesture {
                                animal = [
                                    Animal(imageName: "giftbox", species: "Box", price: "500"),
                                    Animal(imageName: "giftbox", species: "Box", price: "1000"),
                                    Animal(imageName: "giftbox", species: "Box", price: "800"),
                                    Animal(imageName: "giftbox", species: "Box", price: "1200"),
                                    Animal(imageName: "giftbox", species: "Box", price: "700"),
                                    Animal(imageName: "giftbox", species: "Box", price: "1500")]
                            }
                        Button(action: {
                            animal.removeAll()
                            animal = [
                                Animal(imageName: "dog1", species: "Dog", price: "500"),
                                Animal(imageName: "dog2", species: "Dog", price: "1000"),
                                Animal(imageName: "dog3", species: "Dog", price: "800"),]
                        }) {
                            Text("Dog")
                                .padding(.leading, 10)
                                .font(.footnote)
                                .frame(width: 60, height: 40, alignment: .leading)
                        }
                        Button(action: {
                            animal.removeAll()
                            animal = [
                                Animal(imageName: "cat1", species: "Cat", price: "500"),
                                Animal(imageName: "cat2", species: "Cat", price: "1000"),
                                Animal(imageName: "cat3", species: "Cat", price: "700"),
                                Animal(imageName: "cat4", species: "Cat", price: "200"),
                                Animal(imageName: "cat5", species: "Cat", price: "800"),]
                        }) {
                            Text("Cat")
                                .padding(.leading, 10)
                                .font(.footnote)
                                .frame(width: 60, height: 40, alignment: .leading)
                        }
                        Spacer()
                    }
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 10){
                            ForEach(animal) { animal in
                                NavigationLink(destination: AnimalInfo(animal: animal)) {
                                    GridsModel(name: animal.species, image: animal.imageName, price: animal.price)
                                }
                            }
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                }
            }.navigationBarHidden(true)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




