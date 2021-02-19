import SwiftUI

struct BuyButton: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button(action: {
                
            }) {
                Text("Button")
            }
        }
    }
}

struct AddButton: View {
    var body: some View {
        
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button(action: {
                
            }) {
                Text("Button")
            }
        }
    }
}



struct Button_Previews: PreviewProvider {
    static var previews: some View {
        BuyButton()
    }
}
