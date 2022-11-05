//
//  ErrorView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    private var textError: String
    
    init(error: String){
        textError = error
    }
    var body: some View {
        ZStack{
            //We need it to change the unsafe area color
            Color.red
                .opacity(0.3)
            .ignoresSafeArea()
            //The Error Functionality
            VStack{
                Spacer()
                Image(systemName: "exclamationmark.bubble")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 200, height: 200)
                    .padding()
                Text(textError)
                    .foregroundColor(.red)
                    .font(.headline)
                Spacer()
                Button {
                    //Return Login with rootViewModel.status
                    rootViewModel.status = .login
                } label: {
                    Text("Return Login")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(.orange)
                        .cornerRadius(20)
                        .shadow(radius: 10.0, x: 20, y: 15)
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error test")
    }
}
