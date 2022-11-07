//
//  DevelopersViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 7/11/22.
//

import Foundation
import Combine

final class DevelopersViewModel: ObservableObject{
    @Published var developers: [Developer]?
    @Published var status = Status.login
    
    var subscribers = Set<AnyCancellable>()
    
    //Cancel all subcribers
    func cancelAll(){
        subscribers.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    //Function to get developers from server using Combine
    func getHeroes(filter: String) {
        //Delete all subscribers to clean memory
        cancelAll()
        self.status = .loading
        
        //Genericos heroes - developers
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionDevelopers())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Developer].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
        //Hasta aqui genericos
            .sink { completion in
                switch completion{
                case.failure(let error):
                    print("Error \(error)")
                    self.status = .error(error: String(describing: error))
                case .finished:
                    print("Success")
                    self.status = .home
                }
            } receiveValue: { data in
                self.developers = data
            }
            .store(in: &subscribers)
    }
    
    
}
