//
//  DevelopersRowView.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 9/11/22.
//

import SwiftUI

struct DevelopersRowView: View {
    var data: Developer
    
    var body: some View {
        VStack{
        //Donwload photo
        AsyncImage(url: URL(string: data.photo)) { photoDownloaded in
            photoDownloaded
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
        } placeholder: {
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
        }
        
        //Name & Surname
        
        Text("\(data.name)\(data.apell1)")
            .font(.caption)
            .foregroundColor(.orange)
        }
    }
}

struct DevelopersRowView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopersRowView(data: Developer(bootcamp: Bootcamp(id: "01", name: "Bootcamp X"), id: "100", apell1: "Bustos", apell2: "Esteban", email: "", name: "Jose Luis", photo: "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://images.ctfassets.net/wp1lcwdav1p1/gzZpBDV3nX1AWytfLhbgs/d528553697d959544c8ca5b80b6d8beb/web_developer.png?w=1500&h=680&q=60&fit=fill&f=faces&fm=jpg&fl=progressive&auto=format%2Ccompress&dpr=1&w=1000&h=", heroes: []))
    }
}
