
import SwiftUI

struct Notificacoes: View {
    var animal: Pets
   @State var animais : [Pets] = []
    var body: some View {
        Text(animal.nome!)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color("Color2"))
        Image(animal.image)
            .resizable().frame(width: 150,height: 150)
        Spacer()
        Text(animal.desc!)
            .frame(width: 300.0)
        Spacer()
                    NavigationLink(destination: ChatView()){
            Text("Entrar em contato")
        }
    }
}


