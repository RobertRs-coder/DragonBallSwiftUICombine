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
    @State private var textError = ""
    
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
                                //Just is Combine publisher
                                .onReceive(Just($data.bootcamp)) { value in
                                    //Receive the object selected in the picker
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
                
                //Button to register
                if viewModel.status != .registerSuccess {
                    Section(""){
                        Button {
                            //Action register
                            if !data.isValidPass(){
                                textError = "The passwords aren't the same or the size is shorter than 6 characters"
                                showAlert.toggle()
                                return
                            }
                            if !data.validateMail(){
                                textError = "Email format incorrect"
                                showAlert.toggle()
                                return
                            }
                            if data.allDataIsSuccess(){
                                viewModel.registerUser(dataForm: data)
                                rootViewModel.status = .login
                            } else {
                                textError = "The fields aren't correct, please fill all fields"
                                showAlert.toggle()
                            }
                        } label: {
                            Text("Register")
                        }
                    }
                }
                //Button to return to Login
                Button {
                    rootViewModel.status = .login //Return to login
                } label: {
                    Text("Return Login")
                }

            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(""), message: Text(textError), dismissButton: .default(Text("Ok")))
        }
        .onReceive(viewModel.$status) { _ in
            if viewModel.status == .registerSuccess{
                textError = "Success Register"
                showAlert.toggle()
                rootViewModel.status = .login
            } else if viewModel.status == .registerError{
                textError = "Error Register"
                showAlert.toggle()
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
