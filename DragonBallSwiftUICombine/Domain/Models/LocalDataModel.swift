//
//  LocalDataModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 7/11/22.
//

import Foundation

final class LocalDataModel {
    private static let userDefaults = UserDefaults.standard
    
    static func getSyncDate() -> Date? {
        userDefaults.object(forKey: "LastSyncDate") as? Date
    }
    
    static func saveSyncDate() {
        userDefaults.set(Date(), forKey: "LastSyncDate")
    }
}
