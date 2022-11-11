//
//  DevelopersView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 8/11/22.
//

import SwiftUI

struct DevelopersView: View {
    @EnvironmentObject private var rootViewModel: RootViewModel
    @StateObject var viewModel: DevelopersViewModel
    @State private var selectedDeveloper: Developer? //Save developers with 2 taps
    
    var body: some View {
        ZStack{
            ScrollView(){
                //Step1: Iterate in bootcamps
                if let bootcamps = rootViewModel.bootcamps,
                   let _ = viewModel.developers{
                    //We have bootcamps & developers
                    ForEach(bootcamps) { bootcamp in
                        let dataFilter = viewModel.getDevelopersOfBootcamp(id: bootcamp.id)
                        if dataFilter.count > 0{
                            //There is develops
                            VStack(alignment: .leading){
                                //Bootcamp title
                                Text(bootcamp.name)
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .bold()
                                    
                                
                                //Horizontal list -> Netflix type
                                ScrollView(.horizontal, showsIndicators: true){
                                    //Content -> Lazy control memory draw few objects not all
                                    LazyHStack{
                                        ForEach(dataFilter) { developer in
                                            DevelopersRowView(data: developer)
                                                .onTapGesture(count: 2){
                                                    //Show modal
                                                    selectedDeveloper = developer
                                                }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                } else{
                    Text("Without data")
                }

            }
            .sheet(item: self.$selectedDeveloper) { developer in
                //TODO: Open modal
                FavoritesHeroesView(data: developer)
            }
        }
        .padding()
    }
}

struct DevelopersView_Previews: PreviewProvider {
    static var previews: some View {
        let rootViewModel = RootViewModel(testing: true)
        
        DevelopersView(viewModel: DevelopersViewModel(testing: true, bootcamps: rootViewModel.bootcamps!))
            .environmentObject(rootViewModel)
    }
}
