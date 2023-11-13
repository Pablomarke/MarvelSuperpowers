//
//  DetailView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 6/11/23.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        Text(viewModel.hero?.name ?? "Unknown name")
            .bold()
            .font(.title)
            .opacity(0.8)
        VStack{
            HStack{
                ///Imagen
                AsyncImage(url: (viewModel.hero?.thumbnail?.thumbnailComplete())){ photo in
                    photo
                        .resizable()
                        .frame(width: 160, height: 160, alignment: .center)
                        .cornerRadius(30)
                        .opacity(0.9)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                }
                
                ///Descripción
                if viewModel.hero?.description == "" {
                    Text( "No description available")
                } else {
                    Text(viewModel.hero?.description ?? "No description available")
                        .font(.callout)
                }
                // Spacer()
            }
            
            List{
                Text("Series")
                    .font(.title2)
                if let series = viewModel.series{
                    if series.isEmpty {
                        Text ("No series available")
                    } else {
                        ForEach(series){ serie in
                            DetailRowView(model: serie)
                                .frame(height: 120)
                                .background(.white)
                        }
                    }
                }
                    
            }
            .listStyle(.grouped)
            
        }
        
    }
        
}

#Preview {
    DetailView(viewModel: DetailViewModel(hero:  HeroeData(id: 1011334, name: "3-D Man", description: "Este es el heroe mas feo que habia, pero lo escogí por ser el primero", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: Series(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))))
}
