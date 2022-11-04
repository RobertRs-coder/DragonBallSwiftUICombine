//
//  RootViewModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 4/11/22.
//

import Foundation
import Combine

final class RootViewmodel: ObservableObject{
    //MARK: Published variables
    @Published var status = Status.none
    @Published var tokenJWT: String = ""
    
    private var subscribers = Set<AnyCancellable>()
    
        
}
