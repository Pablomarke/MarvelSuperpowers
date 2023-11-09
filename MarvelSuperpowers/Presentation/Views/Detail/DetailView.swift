//
//  DetailView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import SwiftUI

struct DetailView: View {
    
    var model: HeroeData
    
    var body: some View {
        Text(model.name ?? "Nombre desconocido")
            .bold()
            .font(.largeTitle)
            .opacity(0.8)
        Spacer()
        VStack{
            AsyncImage(url: (model.thumbnail?.thumbnailComplete())){ photo in
                photo
                    .resizable()
                    .cornerRadius(30)
                    .opacity(0.9)
                    
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            
            VStack{
                if model.description == "" {
                    Text( "No description available")
                } else {
                    Text(model.description ?? "Sin descripción")
                        .font(.callout)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    DetailView(model: HeroeData(id: 1011334, name: "3-D Man", description: "Este es el heroe mas feo que habia, pero lo escogí por ser el primero", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")))
}
