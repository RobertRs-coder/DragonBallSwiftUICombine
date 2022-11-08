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
    
    var body: some View {
        ScrollView(){
            //Step1: Iterate in bootcamps
            if let bootcamps = rootViewModel.bootcamps,
               let developers = viewModel.developers{
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
                                //Content
                                HStack{
                                    ForEach(dataFilter) { filter in
                                        Text(filter.name)
                                    }
                                }
                            }
                        }
                    }
                }
                
            } else{
                Text("Without data")
            }
        
            //Step 2: Developers from bootcamp
//            viewModel.getDevelopersOfBootcamp(id: bootcamp.name)
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
