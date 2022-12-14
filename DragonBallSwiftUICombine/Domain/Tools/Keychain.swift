//
//  Keychain.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 2/11/22.
//

import KeychainSwift

//Class to manage KeychainSwift package inside our project
final class Keychain {
    static let keychain = KeychainSwift()

    //Function to save keychain
    @discardableResult
    static func saveKeychain(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8){
            keychain.set(data, forKey: key)
            //Use keychain between ios & watch app -> Certificate Apple Web
            //keychain.accessGroup = "<GROUPAPP>.com.robertrs.DragonBallSwiftUICombine"
            return true
        } else{
            return false
        }
    }
    
    //Function to load keychain
    static func loadKeychain(key: String) -> String? {
        if let data = keychain.get(key){
            return data
        } else{
            return ""
        }
    }
    
    //Function to delete keychain
    static func deleteKeychain(key: String) {
        keychain.delete(key)
    }
}
