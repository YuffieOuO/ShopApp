import Combine
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    var imageName, species, price: String
}


// MARK: Product
struct Product: Decodable {
    var records: Records
}

struct Records: Decodable {
    var fields: [Fields]
}

struct Fields: Decodable,Hashable {
    var type: String
    var images: [Images]
    var description: String
    var color: [String]
    var size: String
}

struct Images: Decodable ,Hashable{
    var url: String
}

class ProductViewModel: ObservableObject {
    @Published var fields = [Fields]()
    
    init() {
        
        guard let url = URL(string: "https://api.airtable.com/v0/app9OGK8p0uZtAeKp/Furniture?api_key=keyp6AFzaTKrHngbv") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check response status and error
            guard let data = data else { return }
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                print("商品",product)
                self.fields = product.records.fields
            } catch {
                print("Failed to decode: \(error)")
            }
        }.resume()
    }
}




struct ProductView: View {
    @ObservedObject var vm = ProductViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200))
                ], spacing: 12, content: {
                    ForEach(vm.fields, id: \.self) { num in
                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                            
                            Text("App Title")
                                .font(.system(size: 10, weight: .semibold))
                            Text("Release Date")
                                .font(.system(size: 9, weight: .regular))
                            Text("Copyright")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.red)
                    }
                }).padding(.horizontal, 12)
            }.navigationTitle("Grid Search")
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
