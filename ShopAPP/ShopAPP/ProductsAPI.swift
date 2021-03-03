// 參考網址：https://www.youtube.com/watch?v=eu-YaVvsbjQ
import Combine
import SwiftUI
import Kingfisher

struct Animal: Identifiable {
    let id = UUID()
    var imageName, species, price: String
}

// MARK: Product
struct Product: Decodable {
    var records: [Records]
}

struct Records: Decodable, Hashable {
    var fields: Fields
}
// Hashable 比較
struct Fields: Decodable, Hashable {
    var `Type`: String
    var Images: [Images]
    var Description: String
    var Color: [String]
    var Name: String
//    var Unitcost: Int
//    var size: String
}
// images的型別 [Image]，struct不可以被比較所以必須加Hashable
struct Images: Decodable, Hashable {
    var url: String
}

class ProductViewModel: ObservableObject {
    
    @Published var records = [Records]()
    
    let urlString = "https://api.airtable.com/v0/app9OGK8p0uZtAeKp/Furniture?api_key=keyp6AFzaTKrHngbv"
    
    init() {
        
        guard let url = URL(string:urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check response status and error
            guard let data = data else { return }
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                print("商品",product)
                // DispatchQueue.main.async
                DispatchQueue.main.async {
                    self.records = product.records
                }
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
}


struct ProductView: View {
    @ObservedObject var productModel = ProductViewModel()
    
    private let layout = [
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 16, alignment: .top),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 16, alignment: .top),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 16)]
    

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, alignment: .leading, spacing: 16, content: {
                    ForEach(productModel.records, id: \.self) { app in
                        ProductGrids(app: app)
                    }
                }).padding(.horizontal, 12)
            }.navigationTitle("Product")
        }
    }
}


struct ProductGrids: View {
    let app: Records
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            KFImage(URL(string: app.fields.Images[0].url))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(22)

            Text(app.fields.Name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.top, 4)
            
            Text(app.fields.Type)
                .font(.system(size: 9, weight: .regular))
            
            Text(app.fields.Color[0])
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
