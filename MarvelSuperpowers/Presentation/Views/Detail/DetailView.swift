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
        switch viewModel.detailStatus {
            case .loading :
                LoadView()
            case .error :
                ErrorView()
            default:
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
                                .foregroundColor(Color.white)
                        } else {
                            ScrollView{
                                Text(viewModel.hero?.description ?? "No description available")
                                    .background(Color.clear)
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    .frame(height: 160)
                    
                    VStack{
                        ScrollView{
                            Text("Series")
                                .font(.title2)
                                .foregroundColor(Color.white)
                            if let series = viewModel.series{
                                if series.isEmpty {
                                    Text ("No series available")
                                } else {
                                    ForEach(series){ serie in
                                        DetailRowView(model: serie)
                                            .frame( height: 224)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .navigationBarTitle(viewModel.hero?.name ?? "Unknown Hero", displayMode: .inline)
                .background(Image("redwall")
                    .resizable()
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                )
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(testing: true, hero: HeroeData(id: 1011334, name: "3-D Man", description: "Este heroe lo escogí por ser el primero. No lo conocen ni en su casa. Es el tipico que mientras está actuando aparece su madre y lo manda para casa", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItems(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", name: "Serie 1")], returned: 2))))
    
}
