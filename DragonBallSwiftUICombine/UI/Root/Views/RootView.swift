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
        switch rootViewModel.status {
        case .login:
            LoginView()
        case .register:
            Text("Register")
        case .loading:
            LoadingView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .home:
            HomeView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
