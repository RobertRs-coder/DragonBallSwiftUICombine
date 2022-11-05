//
//  LoginView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 2/11/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var rootViewModel: RootViewModel

#if DEBUG
    @State private var email = "rrojo.va@gmail.com"
    @State var password = "123456"
#else
    @State private var email = ""
    @State var password = ""
#endif
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack{
            Image(decorative: "backgroundLogin")
                .resizable()
                .opacity(1)
            
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.2)
            
            VStack{
                Image(decorative: "title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .opacity(0.8)
                    .padding(.top, 150)
                
                Spacer()
                
                VStack{
                    TextField("Email", text: $email)
                        .padding()
                        .frame(height: 40)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 2.0, x: 20, y: 10)
                    //                        .autocapitalization(.none) //< iOS 16
                        .textInputAutocapitalization(.never)
                    //                        .disableAutocorrection(.true) // < iOS16
                        .autocorrectionDisabled()
                        .opacity(0.8)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(height: 40)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 2.0, x: 20, y: 10)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .opacity(0.8)
                        .padding(.top, 10)
                }
                .padding([.leading, .trailing], 20) //padding for the VStack contains fields
                
                Button {
                    //Call rootViewModel login()
                    rootViewModel.login(user: email, password: password)
                } label: {
                    Text("Login")
                        .padding()
                        .frame(height: 40)
                        .font(.title2)
                        .foregroundColor(.white)
                    //RGB color -> Better with extensions
                        .background(Color(uiColor: UIColor(red: 221.0/255.0, green: 99.0/255.0, blue: 0.0, alpha: 1.0)))
                        .cornerRadius(15)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }
                .padding(.top, 50)
                .opacity(0.8)
                .overlay(
                    Circle()
                        .stroke(.white)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(.easeInOut(duration: 1).repeatForever(), value: animationAmount)
                        .padding(.top, 45)
                        .onAppear{
                            animationAmount = 2
                        }
                )
                Spacer ()
                
                HStack{
                    Text("You are not register")
                        .foregroundColor(.white)
                        .bold()
                    
                    Button {
                        //TODO: Register into RegisterView
                    } label: {
                        Text("Register")
                            .foregroundColor(.blue)
                    }

                }
                .padding(.bottom, 20)
            }
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
