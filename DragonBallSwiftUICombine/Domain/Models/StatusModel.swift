//
//  StatusModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation

enum Status {
    case login, loading, main, register, error(error: String)
}

//Register Status
enum RegisterStatus {
    case none, registering, registerSuccess, registerError
}
