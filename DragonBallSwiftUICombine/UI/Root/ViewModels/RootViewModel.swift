//
//  RootViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation
import Combine

public let CONST_TOKEN_ID = "tokenJWTKeychain"

final class RootViewModel: ObservableObject{
    //MARK: Published variables
    @Published var status = Status.login
    private var subscribers = Set<AnyCancellable>()
    
    /*
    @Published var tokenJWT: String = "" {
        didSet{
            if tokenJWT != "" {
                Keychain.shared.saveKeychain(key: CONST_TOKEN_ID, value: tokenJWT) //When value change it's save it Keychain
                print("Token: \(tokenJWT)")
            }
        }
    }
     */
    @PersistenceKeychain(key: CONST_TOKEN_ID)
    var tokenJWT
    
    init() {
        //Token control
        self.loggedUserControl()
    }
    
    /*
    func loggedUserControl() {
        let tokenSaved = Keychain.shared.loadKeychain(key: CONST_TOKEN_ID)
        
        if let token = tokenSaved {
            self.tokenJWT = token
            
            if token.count > 0 {
                self.status = .loaded //We change status to skip Login
                
            }
        }
    }
     */
    
    func loggedUserControl() {
//        Keychain.deleteKeychain(key: CONST_TOKEN_ID)
        //Check date of the token
        if let date = LocalDataModel.getSyncDate(),
              date.addingTimeInterval(1) > Date() {
            Keychain.deleteKeychain(key: CONST_TOKEN_ID)
              }
        
        if self.tokenJWT != "" {
            
            self.status = .home
        }
    }
    
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
                    self.status = .home // Login Success
                }
            } receiveValue: { token in
                self.tokenJWT = token
                //Save date which you get token
                LocalDataModel.saveSyncDate()
            }
            .store(in: &subscribers)
    }
}
