import SwiftUI

struct ShopIcon: View {
    var body: some View {
        HStack {
            Image("shop-338-454916")
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .padding([.top, .leading],5)
            Text("XXX Shop")
                .font(.headline)
                .frame(width: 250, height: 60, alignment: .leading)
                .padding(.top, 10)
            Spacer()

        }
    }
}

struct ReturnButton: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        Button(action : {
            mode.wrappedValue.dismiss()
        }){
            Image("arrow-direction-left-way-backword-previous-51-28597").resizable().frame(width: 50, height: 50)
        }
    }
}

struct ShoppingCartButton: View {
    var body: some View {
        NavigationLink(destination: ShoppingCart()){
            Image("basket").resizable().frame(width: 50, height: 50)
        }
    }
}



struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ReturnButton()
    }
}
