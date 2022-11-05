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
    
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue: String {
        set{
            Keychain.saveKeychain(key: key, value: newValue)
        }
        get{
            if let value = Keychain.loadKeychain(key: key) {
                return value
            } else{
                return ""
            }
        }
    }
}
