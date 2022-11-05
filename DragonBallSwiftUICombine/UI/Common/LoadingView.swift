//
//  LoadingView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 5/11/22.
//

import SwiftUI

struct LoadingView: View {
    @State private var animate = false
    var body: some View {
        ZStack{
            Circle()
                .fill(.orange)
                .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaleEffect(animate ? 1.0 : 0.5)
//                .animation(Animation.easeInOut(duration: 0.5).repeatForever()) < iOS16
                .animation(.easeInOut(duration: 0.5).repeatForever(), value: animate)
            Text("Loading")
                .foregroundColor(.white)
                .font(.title2)
        }
        .onAppear{
            self.animate = true
        }
        .onDisappear{
            self.animate = false
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
