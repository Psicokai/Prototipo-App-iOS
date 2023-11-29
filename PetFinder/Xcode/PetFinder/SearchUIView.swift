
import SwiftUI

struct SearchUIView: View {
    @State private var search: String = ""
    
    var filteredPet: [Pets] {
        guard !search.isEmpty else {return swiftUIView.pet}
        
        return swiftUIView.pet.filter {
            $0.desc!.localizedCaseInsensitiveContains(search)
        }
    }
    
    @StateObject var swiftUIView = ViewModel()
    
    
    var body: some View {
        NavigationStack {
         
            VStack {
                List(filteredPet) {
                    i in
                    NavigationLink(destination: MapaView(animal: i)) {
                        HStack {
                            Image(i.image)
                            Text(i.resumo!)
                        }
                    }
                
                    
                }
                
            }
        }
        .onAppear(){
            swiftUIView.fetch()
        }
        .searchable(text: $search, prompt: "Ache seu pet...")
    }
    
    
    struct SearchUIView_Previews: PreviewProvider {
        static var previews: some View {
            SearchUIView()
        }
    }
    
    struct mBorder: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding()
                .background(.white)
                .clipShape(Capsule())
        }
    }
    
}
