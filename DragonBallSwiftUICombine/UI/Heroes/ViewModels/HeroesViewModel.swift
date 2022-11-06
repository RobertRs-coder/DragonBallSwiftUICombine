//
//  HeroesViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//
import Foundation
import Combine
 
final class HeroesViewModel: ObservableObject {
    @Published var heroes: [Hero]?
    @Published var status = Status.login
    
    private var subscribers = Set<AnyCancellable>()
    
    init(testing: Bool = false){
        if testing{
            getHeroesTesting()
        } else{
            getHeroes(filter: "")
        }
    }
    //Function to get data from server using Combine
    func getHeroes(filter: String) {
        self.status = .loading
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeroes(filter: filter))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [Hero].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
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
                self.heroes = data
            }
            .store(in: &subscribers)
    }
    
    //Design & Testing
    func getHeroesTesting() {
        //Create array of 4 heroes
        let hero1 = Hero(
            id: UUID(),
            name: "Goku",
            description: "Sobran las presentaciones cuando se habla de Goku.",
            photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300",
            favorite: true
        )
        let hero2 = Hero(
            id: UUID(),
            name: "Vegeta",
            description: "Vegeta es todo lo contrario.",
            photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300",
            favorite: false
        )
        self.heroes = [hero1, hero2]
        //Change status to home
        self.status = .home
    }
}
