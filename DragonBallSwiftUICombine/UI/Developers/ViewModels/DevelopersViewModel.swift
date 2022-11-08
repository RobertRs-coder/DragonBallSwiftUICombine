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
    
    init(testing: Bool = false, bootcamps: [Bootcamp] = []){
        if testing{
            getDevelopersTesting(bootcamps: bootcamps)
        } else{
            getDevelopers()
        }
    }
    //Cancel all subcribers
    func cancelAll(){
        subscribers.forEach { AnyCancellable in
            AnyCancellable.cancel()
        }
    }
    //Function to get developers from server using Combine
    func getDevelopers() {
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
    
    //Look for developers from bootcamp
    func getDevelopersOfBootcamp(id:String) -> [Developer]{
        return developers!
            .filter({$0.bootcamp.id == id})
    }
    
    //Design & Testing
    func getDevelopersTesting(bootcamps: [Bootcamp]){
        let b1 = Bootcamp(id: bootcamps[0].id, name: bootcamps[0].name)
        let b2 = Bootcamp(id: bootcamps[1].id, name: bootcamps[1].name)
        
        let dev1 = Developer(bootcamp: b1, id: "100", apell1: "Bustos", apell2: "Esteban", email: "", name: "Jose Luis", photo: "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://images.ctfassets.net/wp1lcwdav1p1/gzZpBDV3nX1AWytfLhbgs/d528553697d959544c8ca5b80b6d8beb/web_developer.png?w=1500&h=680&q=60&fit=fill&f=faces&fm=jpg&fl=progressive&auto=format%2Ccompress&dpr=1&w=1000&h=", heros: [])
        
        let dev2 = Developer(bootcamp: b2, id: "200", apell1: "Aguirre", apell2: "Lopez", email: "", name: "Antonio", photo: "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://images.ctfassets.net/wp1lcwdav1p1/gzZpBDV3nX1AWytfLhbgs/d528553697d959544c8ca5b80b6d8beb/web_developer.png?w=1500&h=680&q=60&fit=fill&f=faces&fm=jpg&fl=progressive&auto=format%2Ccompress&dpr=1&w=1000&h=", heros: [])
    
        self.developers = [dev1, dev2]
    }
}
