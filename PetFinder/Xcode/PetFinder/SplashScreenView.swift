//
//  SplashScreenView.swift
//  PetFinder
//
//  Created by Student on 28/09/23.
//
//  Created by Student07 on 27/09/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            ContentView()
        }else{
            VStack{
                VStack{
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200.0)
                    
                }
                .padding(.bottom, 20.0)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration:1.2)){
                        self.size = 1
                        self.opacity = 1.0
                    }
                }
                .background()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }

    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
