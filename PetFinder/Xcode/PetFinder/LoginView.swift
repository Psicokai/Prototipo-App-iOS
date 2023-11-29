import SwiftUI

struct LoginView: View {
    @State private var email : String = ""
    @State private var senha: String = ""
    
var body: some View {
        
    ZStack {
            Image("login_cat")
                .padding(.top, 150.0)
            VStack {
                Image("icon")
                    .resizable()
                    .frame(width: 160, height: 150)
                    .padding(.top, 200.0)
                TextField("Digite seu e-mail", text: $email)
                    .padding(.bottom)
                    .frame(width: 300, height: 80, alignment: .bottom)
                    .textFieldStyle(myBorder())
                SecureField("Digite sua senha", text: $senha)
                    .frame(width: 300
                           , height: 80, alignment: .top)
                    .textFieldStyle(myBorder())
            }
            .padding(.bottom, 500.0)
            Button {
                print("Edit button was tapped")
            } label: {
                Text("Entrar")
                    .fontWeight(.bold)
                    
            }
            .frame(width: 260.0, height: 40.0)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .padding()
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct myBorder: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(.white)
            .clipShape(Capsule())

    }
}
