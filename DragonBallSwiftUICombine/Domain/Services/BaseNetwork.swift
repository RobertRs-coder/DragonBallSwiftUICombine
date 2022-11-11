//
//  BaseNetwork.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation

let server = "https://dragonball.keepcoding.education"

struct HTTPMethod {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let content = "application/json "
}

enum endpoint: String {
    case login = "/api/auth/login"
    case heroList = "/api/heros/all"
    case developerList = "/api/data/developers"
    case bootcampList = "/api/data/bootcamps" //Not security
    case like = "/api/data/herolike"
}
//Use this to call server
struct BaseNetwork {
    func getSessionLogin(user: String, password: String) -> URLRequest {
        let url = URL(string: "\(server)\(endpoint.login.rawValue)")
        //Encode credentials
        let encodedCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var securedCredentials = ""
        //Unwrap base64 optional value
        if let encodedCredentials = encodedCredentials {
            securedCredentials = "Basic \(encodedCredentials)"
        }
        
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post
        //Request header
        request.addValue(HTTPMethod.content, forHTTPHeaderField: "Content-type")
        request.addValue(securedCredentials, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func getSessionHeroes(filter: String) -> URLRequest {
        let url = URL(string: "\(server)\(endpoint.heroList.rawValue)")
        
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post
        
        //Request json body
        request.httpBody = try? JSONEncoder().encode(HeroFilterRequest(name: filter))
        //Request header
        request.addValue(HTTPMethod.content, forHTTPHeaderField: "Content-type")
        
        //Security
        let token = Keychain.loadKeychain(key: CONST_TOKEN_ID)
        if let tokenJWT = token{
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    func getSessionDevelopers() -> URLRequest {
        let url = URL(string: "\(server)\(endpoint.developerList.rawValue)")
        
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get

        //Request header
        request.addValue(HTTPMethod.content, forHTTPHeaderField: "Content-type")
        
        //Security
        let token = Keychain.loadKeychain(key: CONST_TOKEN_ID)
        if let tokenJWT = token{
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    /*
        No security because when user register inside the app they need to select bootcamp"
     */
    func getSessionBootcamps() -> URLRequest {
        let url = URL(string: "\(server)\(endpoint.bootcampList.rawValue)")
        
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get

        //Request header
        request.addValue(HTTPMethod.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
    //request like hero
    func getSessionLike(idHero: String) -> URLRequest {
        let url = URL(string: "\(server)\(endpoint.like.rawValue)")
        
        //Create request from url
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.post
        
        //Request json body
        request.httpBody = try? JSONEncoder().encode(HeroLikeRequest(hero: idHero))
        //Request header
        request.addValue(HTTPMethod.content, forHTTPHeaderField: "Content-type")
        
        //Security
        let token = Keychain.loadKeychain(key: CONST_TOKEN_ID)
        if let tokenJWT = token{
            request.addValue("Bearer \(tokenJWT)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}
