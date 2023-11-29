import MapKit
import SwiftUI

struct ContentView1: View {
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -23.7880, longitude: -46.6653),
        span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    
    @StateObject var swiftUIView = ViewModel()
    
        var body: some View {
            NavigationStack{
          
                 

               
                VStack(alignment: .center) {
                    Text("FindPet")
                        .font(.largeTitle)
                         .fontWeight(.bold)
                         .foregroundColor(Color("Color2"))
                         .multilineTextAlignment(.center)
                         .padding(.top)
                         
                     List(swiftUIView.pet) { animal in
                         
                        HStack(alignment: .center) {
                                Image(animal.image)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    NavigationLink(destination: MapaView(animal: animal)){
                                        Text(animal.nome!)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("Color2"))
                                            .font(.headline)
                                    }
                                    
                                    
                                    Text(animal.resumo!)
                                        .font(.subheadline)
                                }
                            
                            
                }
                    
                }
                
                    }
                     .onAppear(){
                         swiftUIView.fetch()
                     }
                     .background(Color("bg_feed"))
            }
            }
}
    
    
    struct ContentView1_Previews: PreviewProvider {
        static var previews: some View {
            ContentView1()
        }
    }

