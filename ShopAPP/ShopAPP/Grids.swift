import SwiftUI

struct Grids: View {
    
    let animal: Animal
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Text(animal.species).padding(0)
                .frame(width: 80)
            Image(animal.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .clipped()
            Text("Price " + animal.price)
                .frame(width: 80)
                .padding(0)
                .font(.callout)
        }.padding(0)
    }
}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        Grids(animal: Animal(imageName: "dog1", species: "Dog", price: "1000"))
    }
}
