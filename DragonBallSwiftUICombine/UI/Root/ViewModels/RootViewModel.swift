//
//  RootViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation
import Combine

final class RootViewmodel: ObservableObject{
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
    }

}
