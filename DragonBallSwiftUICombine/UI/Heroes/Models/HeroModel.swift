//
//  HeroModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import Foundation


//Server response
struct Hero: Codable, Identifiable{
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var favorite: Bool?
    
}

//To filter server
struct HeroFilter: Codable{
    var name: String
}


//For request  hero likie

struct HeroLikeRequest{
    var hero: String
}
