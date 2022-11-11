//
//  FavoritesHeroesView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 11/11/22.
//

import SwiftUI

struct FavoritesHeroesView: View {
    @Environment(\.presentationMode) private var presentationMode //To close modal
    var data: Developer
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                ForEach(data.heroes){ hero in
                    Text(hero.name)
                }
                Button {
                    //Close
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Exit")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.orange)
                        .cornerRadius(20)
                }

            }
        }
    }
}

struct FavoritesHeroesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesHeroesView(data: Developer(bootcamp: Bootcamp(id: "01", name: "Bootcamp IV"), id: "100", apell1: "Bustos", apell2: "Esteban", email: "", name: "Jose Luis", photo: "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://images.ctfassets.net/wp1lcwdav1p1/gzZpBDV3nX1AWytfLhbgs/d528553697d959544c8ca5b80b6d8beb/web_developer.png?w=1500&h=680&q=60&fit=fill&f=faces&fm=jpg&fl=progressive&auto=format%2Ccompress&dpr=1&w=1000&h=", heroes: HeroesViewModel(testing: true).getHeroesDesign()))
    }
}
