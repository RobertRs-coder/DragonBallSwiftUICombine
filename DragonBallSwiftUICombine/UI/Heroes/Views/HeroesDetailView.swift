//
//  HeroesDetailView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 7/11/22.
//

import SwiftUI

struct HeroesDetailView: View {
    //Because it's a subview and  I want to destroy it
    @ObservedObject var viewModel: HeroesViewModel
    var hero: Hero
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack{
                HStack{
                    Text(hero.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
//                        .padding([.top, .leading], 10)
                    Spacer()
                    Button {
                        //Call like it function
                        viewModel.callToLike(idHero: hero.id.uuidString)
                    } label: {
//                        if hero.favorite ?? false {
//                            Image(systemName: "heart.circle")
//                                .resizable()
//                                .foregroundColor(.red)
//                                .frame(width: 40, height: 40)
//                                .padding(.trailing, 20)
//                        } else {
//                            Image(systemName: "heart.circle")
//                                .resizable()
//                                .foregroundColor(.gray)
//                                .frame(width: 40, height: 40)
//                                .padding(.trailing, 20)
//                        }
                        //Short way to do it
                        Image(systemName: "heart.circle")
                            .resizable()
                        //Ternary operator
                            .foregroundColor(hero.favorite! ? .red : .gray)
                            .frame(width: 40, height: 40)
//                            .padding(.trailing, 20)
                    }
                }
                .padding(20)
                
                AsyncImage(url: URL(string: hero.photo)) { photoDownloaded in
                    photoDownloaded
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                        .opacity(0.8)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                        .opacity(0.8)
                }
                Text(hero.description)
                    .padding(20)
            }
        }
    }
}

struct HeroesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesDetailView(viewModel: HeroesViewModel(), hero: Hero(
            id: UUID(),
            name: "Goku",
            description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.",
            photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300",
            favorite: true
        ))
    }
}
