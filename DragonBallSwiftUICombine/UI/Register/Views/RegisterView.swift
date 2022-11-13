//
//  RegisterView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 12/11/22.
//

import SwiftUI
import Combine

struct RegisterView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @StateObject private var viewModel = RegisterViewModel()
    
    @State private var data = RegisterModel() //Datos formulario
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Form(){
//                Section(header: Text("Datos Personales")) //< iOS16
                Section("Datos Personales"){
                    TextField("Nombre", text: $data.name)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("Primer Apellido", text: $data.apell1)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("Segundo Apellido", text: $data.apell2)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("Segundo Apellido", text: $data.apell2)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("URL foto", text: $data.photo)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                .listRowBackground(Color.orange.opacity(0.5))
                
                Section("Datos Keepcoding"){
                    if let bootcampList = self.rootViewModel.bootcamps{
                        VStack{
                            Picker(selection: $data.bootcamp) {
                                ForEach(bootcampList) { bootcamp in
                                    Text(bootcamp.name)
                                        .foregroundColor(.orange)
                                }
                                .onReceive(Just($data.bootcamp)) { value in
                                    //Receive value selected in the picker
                                }
                            } label: {
                                Text("Bootcamps")
                                
                            }

                        }
                    }
                }
                .listRowBackground(Color.orange.opacity(0.5))
                
                Section("Datos Cuenta"){
                    TextField("Email", text: $data.email)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $data.password)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Repeat Password", text: $data.validpassword)
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                }
                .listRowBackground(Color.orange.opacity(0.5))
                
                //Register button
                if viewModel.status != .registerSuccess {
                    
                }
                //Button return to Login
                Button {
                    rootViewModel.status = .login
                } label: {
                    Text("Return Login")
                }

            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(RootViewModel())
    }
}
