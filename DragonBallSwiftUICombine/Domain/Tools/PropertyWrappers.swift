//
//  PropertyWrappers.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import Foundation

@propertyWrapper
class PersistenceKeychain{
    private var key: String
    private let keychain: Keychain
    
    init(key: String, keychain: Keychain = Keychain()) {
        self.key = key
        self.keychain = keychain
    }
    
    var wrappedValue: String {
        set{
            keychain.saveKeychain(key: key, value: newValue)
        }
        get{
            if let value = keychain.loadKeychain(key: key) {
                return value
            } else{
                return ""
            }
        }
    }
}
