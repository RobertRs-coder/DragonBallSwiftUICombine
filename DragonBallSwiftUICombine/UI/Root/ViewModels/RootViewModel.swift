//
//  RootViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject{
    //MARK: Published variables
    @Published var status = Status.none
    @Published var tokenJWT: String = ""
    
    private var subscribers = Set<AnyCancellable>()
    
    //Login to server
    func login(user: String, password: String) {
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                //Return the string because it's the token
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.status = .error(error: String(describing: error))
                case .finished:
                    self.status = .loaded // Login Success
                }
            } receiveValue: { token in
                self.tokenJWT = token
                print("Token: \(self.tokenJWT)")
            }
            .store(in: &subscribers)
    }
}
