import SwiftUI

let lightGray = Color(red: 0.662745, green: 0.662745, blue: 0.662745)
let primaryColor = Color(red: 0.180392, green: 0.545098, blue: 0.341176)

struct ChatView: View {
    @State private var userMessage = ""
    @State private var messages: [Message] = []
    
    struct Message: Identifiable, Equatable {
        var id = UUID()
        var text: String
        var time: String
        var isUser: Bool
    }
    
    
    private func sendMessage() {
        if !userMessage.isEmpty {
            let newMessage = Message(text: userMessage, time: getCurrentTime(), isUser: true)
            messages.append(newMessage)
            userMessage = ""
        }
    }
    
    private func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
    
    @State var msg = 0
    
    @Namespace var bottomID
    
    var body: some View {
        VStack {
            ZStack{
                
                Rectangle()
                    .frame(maxWidth: 300, maxHeight: 80)
                    .cornerRadius(20)
                    .foregroundColor(.black)
                
                HStack {
                    Spacer()
                    Image("dog2")
                        .resizable()
                        .frame(width: 50, height
                               : 50)
                        .padding(.leading, 10)
                        .padding(.bottom, 12)
                    
                    
                    Text("Animal Encontrado")
                        .font(.headline)
                        .padding(.leading, 5)
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.bottom, 12)
                    
                    
                    
                    Spacer()
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                
            }
            ScrollView {
                ScrollViewReader { scrollView in
                    
                    VStack {
                        VStack{
                            HStack{
                                Spacer()
                                Text("Marieta")
                                    .bold()
                                    .padding(.top, 10)
                            }
                            HStack{
                                Spacer()
                                Text("Você encontrou um animal?")
                                    .padding()
                                    .frame(maxWidth: 260, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                
                            }
                            HStack{
                                Spacer()
                                Text("11:45")
                                    .padding(.bottom, 10)
                            }
                        }
                        
                        VStack{
                            HStack{
                                Text("João")
                                    .bold()
                                    .padding(.top, 10)
                                Spacer()
                            }
                            HStack{
                                Text("Sim, encontrei um cachorro na rua.")
                                    .padding()
                                    .frame(maxWidth: 260 ,alignment: .trailing)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                Spacer()
                            }
                            HStack{
                                Text("11:55")
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            HStack{
                                Spacer()
                                Text("Marieta")
                                    .bold()
                                    .padding(.top, 10)
                            }
                            HStack{
                                Spacer()
                                Text("Que ótimo! Você pode cuidar dele?")
                                    .padding()
                                    .frame(maxWidth: 260, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                            }
                            HStack{
                                Spacer()
                                Text("12:03")
                                    .padding(.bottom, 10)
                            }
                            
                        }
                        VStack{
                            HStack{
                                Text("João")
                                    .bold()
                                    .padding(.top, 10)
                                Spacer()
                            }
                            HStack{
                                Text("Claro, vou levar para casa e cuidar dele.")
                                    .padding()
                                    .frame(maxWidth: 260 ,alignment: .trailing)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                Spacer()
                            }
                            
                            HStack{
                                Text("12:20")
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            HStack{
                                Spacer()
                                Text("Marieta")
                                    .bold()
                                    .padding(.top, 10)
                            }
                            HStack{
                                Spacer()
                                Text("Perfeito! Posso buscá-lo depois das 18:00 :)")
                                    .padding()
                                    .frame(maxWidth: 260, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                            }
                            HStack{
                                Spacer()
                                Text("12:25")
                                    .padding(.bottom, 10.0)
                            }
                            
                        }
                        ForEach(messages) { message in
                            if message.isUser {
                                //                                HStack {
                                //                                    Spacer()
                                //                                    Text("Marieta")
                                //                                        .bold()
                                //                                        .padding(.top, 10)
                                //                                }
                                HStack {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .frame(maxWidth: 260, alignment: .leading)
                                        .foregroundColor(Color.white)
                                        .background(Color.blue)
                                        .cornerRadius(20)
                                }
                                HStack {
                                    Spacer()
                                    Text(message.time)
                                        .padding(.bottom, 10)
                                    
                                }
                            }
                        }
                    }.id(bottomID)
                        .onChange(of: msg){ newValue in
                            withAnimation(.linear(duration: 3)){
                                scrollView.scrollTo(bottomID)
                            }
                        }
                }
                .padding(.horizontal, 10)
            }
            
            HStack {
                TextField("Digite sua mensagem...", text: $userMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    sendMessage()
                    msg += 1
                }) {
                    Text("Enviar")
                }
                .padding(.trailing, 10.0)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10.0)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
