import Foundation
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    var imageName, species, price: String
}
