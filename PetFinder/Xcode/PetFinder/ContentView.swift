import SwiftUI
struct ContentView: View {
    
    var body: some View {
            TabView {
                
                ContentView1().font(.system(size: 20,weight: .regular,design: .rounded))
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                SearchUIView().font(.system(size: 15,weight: .regular,design: .rounded))
                    .tabItem{
                        Label("Pesquisa", systemImage: "magnifyingglass")
                    }
                ChatView().badge(2).font(.system(size: 15,weight: .regular,design: .rounded))
                    .tabItem{
                        Label("Chat", systemImage: "paperplane")
                    }
                LoginView().font(.system(size: 15,weight: .regular,design: .rounded))
                    .tabItem{
                        Label("Perfil", systemImage: "person.crop.circle")
                    }
            }
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
