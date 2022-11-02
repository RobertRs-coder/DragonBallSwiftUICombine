//
//  Keychain.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 2/11/22.
//

import KeychainSwift

//Class to manage KeychainSwift package inside our project
final class Keychain {
    var keychain = KeychainSwift()
    
    //Function to save keychain
    func saveKeychain(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8){
            keychain.set(data, forKey: key)
            
            //Use keychain between ios & watch app -> Certificate Apple Web
            //keychain.accessGroup = "<GROUPAPP>.com.robertrs.DragonBallSwiftUICombine"
            
            return true
        } else{
            return false
        }
    }
    
    //Function to read keychain
    func readKeychain(key: String) -> String? {
        if let data = keychain.get(key){
            return data
        } else{
            return ""
        }
    }
    
    //Function to delete keychain
    func deleteKeychain(key: String) {
        keychain.delete(key)
    }
}
