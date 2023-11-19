//
//  DetailRowView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 10/11/23.
//

import SwiftUI

struct DetailRowView: View {
    
    var model: SingleSerieData
    
    var body: some View {
        ZStack{
            ///Imagen
            AsyncImage(url: model.thumbnail?.thumbnailComplete()){ photo in
                photo
                    .resizable()
                    .cornerRadius(30)
                    .opacity(0.9)
                    .frame(width: .maximum(160, 320))
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(30)
                    .opacity(0.8)
            }
            .background(.clear)
            VStack{
                ///Nombre
                Spacer()
                HStack{
                    Spacer()
                    Text(model.title ?? "No title")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding([.leading, .trailing],20)
                        .frame(maxWidth: .infinity)
                        
                }
                .frame( height: 40)
                .background(.red)
                .cornerRadius(20)
                .opacity(0.9)
            }
        }
      //  .presentationCornerRadius(30)
    }
}

struct DetailRowView_Preview: PreviewProvider {
    static var previews: some View {
        DetailRowView(model: SingleSerieData(id: 123, title: "Los vengadores", description: "Qué guay", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg")) )
            .previewLayout(.fixed(width: 320, height: 160))
    }
}
