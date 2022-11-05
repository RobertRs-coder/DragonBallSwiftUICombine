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
}

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
}



