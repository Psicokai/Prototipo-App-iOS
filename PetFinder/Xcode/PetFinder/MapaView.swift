//
//  MapaView.swift
//  PetFinder
//
//  Created by Student on 22/09/23.
//

//
import SwiftUI
import MapKit

struct MapaView: View {
    @State var isShowingSheet = false
    
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -23.7880, longitude: -46.6653),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    
    @StateObject var swiftUIView = ViewModel()
    
    var animal : Pets
    
    @State var animais: [Pets] = []
    
    
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, annotationItems: animais) { animal in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: animal.coordinate.latitude!, longitude: animal.coordinate.longitude!)) {
                    
                    Image(animal.image) .resizable().scaledToFit().cornerRadius(100).frame(width: 60,height: 60) .onTapGesture {
                    }
                    NavigationLink(destination: Notificacoes(animal: animal)){
                        Text(animal.nome!)
                    }
                }
            }
        }
        .padding(.bottom)
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("PetMap")
        .onAppear(){
            
            if(animais.count == 0){
                animais.append(animal)
            }
            
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: animal.coordinate.latitude!, longitude: animal.coordinate.longitude!),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
        
    }
}


struct MapaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

