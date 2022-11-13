//
//  RegisterViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 12/11/22.
//

import Foundation
import Combine

final class RegisterViewModel: ObservableObject{
    @Published var status = RegisterStatus.none
    private var subscribers = Set<AnyCancellable>()
    
    func registerUser(dataForm: RegisterModel){
        self.status = .registering
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionRegisterUser(data: dataForm))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse else{
                    throw URLError(.badServerResponse)
                }
                return response.statusCode
            }
            .replaceError(with: 400)
            .receive(on: DispatchQueue.main)
            .sink { statusCode in
                if statusCode == 201 {
                    self.status = .registerSuccess
                } else {
                    self.status = .registerError
                }
            }
            .store(in: &subscribers)
    }
}
