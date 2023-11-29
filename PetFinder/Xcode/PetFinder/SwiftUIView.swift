import Foundation

struct Coordinate: Codable, Hashable {
    let latitude: Double?
    let longitude: Double?
    
}

struct Pets: Codable, Identifiable {
    let id: Int
    let nome: String?
    let resumo: String?
    let image: String
    let especie: String?
    let desc: String?
    let coordinate: Coordinate
    
}

class ViewModel : ObservableObject {
    
    @Published var coordinate : [Coordinate] = []
    @Published var pet : [Pets] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.172:1880/petfinderREAD" ) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Pets].self, from: data)
                
                DispatchQueue.main.async {
                    self?.pet = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
