import Foundation
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
struct SettingFile_Previews: PreviewProvider {
    static var previews: some View {
        ShopIcon()
    }
}
