//
//  RootView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 1/11/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case .register:
            Text("Register")
        case .loading:
            Text("Loading")
        case .error(error: let errroString):
            Text("Error: \(errroString)")
        case .loaded:
            Text("Home")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
