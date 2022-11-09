//
//  DeveloperModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 7/11/22.
//

import Foundation

struct Developer: Codable, Identifiable {
    let bootcamp: Bootcamp
    let id, apell1, apell2, email: String
    let name: String
    let photo: String
    let heros: [Hero] //liked heroes from developer
    
//    //I can't do it -> I don't know why??
//    private enum CodinKeys: String, CodingKey, [Hero]{
//        case heroes = "heros"
//    }
    
}

struct Bootcamp: Codable, Identifiable {
    let id: String
    let name: String
}



// //Example CodinKey Protocol
//struct Address : Codable {
//
//    var street: String
//    var zip: String
//    var city: String
//    var state: String
//
//    private enum CodingKeys : String, CodingKey {
//        case street, zip = "zip_code", city, state
//    }
//}
