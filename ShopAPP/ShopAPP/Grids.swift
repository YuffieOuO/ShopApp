import SwiftUI

struct GridsModel: View {
    
    let name: String
    let image: String
    let price: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Text(name).padding(0)
                .frame(width: 80)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .clipped()
            Text("Price " + price)
                .frame(width: 80)
                .padding(0)
                .font(.callout)
        }.padding(0)
    }
}

struct Grids_Previews: PreviewProvider {
    static var previews: some View {
        GridsModel(name: "Dog", image: "dog3", price: "1000")
    }
}
