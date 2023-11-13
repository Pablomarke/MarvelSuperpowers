//
//  DetailRowView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 10/11/23.
//

import SwiftUI

struct DetailRowView: View {
    
    var model: SerieAData
    
    var body: some View {
        ZStack{
            ///Imagen
            AsyncImage(url: model.thumbnail?.thumbnailComplete()){ photo in
                photo
                    .resizable()
                    .cornerRadius(30)
                    .opacity(0.9)
                    .frame(width: .maximum(176, 320))
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            
            VStack{
                ///Nombre
                Spacer()
                HStack{
                    Spacer()
                    Text(model.title ?? "No title")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .padding([.top, .trailing],20)
                }
                .background(.gray)
                .cornerRadius(30)
            }
        }
    }
}

#Preview {
    DetailRowView(model: SerieAData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")) )
}
