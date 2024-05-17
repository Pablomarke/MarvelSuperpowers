//
//  HeroRowView.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 9/11/23.
//

import SwiftUI

struct HeroRowView: View {
    var hero: HeroeData
    
    //MARK: - View -
    var body: some View {
        ZStack{
            AsyncImage(url:  (hero.thumbnail?.thumbnailComplete())){ photo in
                photo
                    .resizable()
                    .frame(height: 224)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .cornerRadius(30)
                    .opacity(0.9)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            }
            .background(.clear)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(hero.name ?? "")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .padding([.leading, .trailing],20)
                        .frame(maxWidth: .infinity)
                    
                }
                .frame( height: 40)
                .background(.gray)
                .cornerRadius(20)
                .opacity(0.9)
                
            }
        }
    }
}

struct HeroRowView_Preview: PreviewProvider {
    static var previews: some View {
        HeroRowView(hero: HeroeData(id: 1011334, name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension2: "jpg"), series: MarvelItem(available: 2, collectionURI: "", items: [ApiItem(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpeg", name: "Serie 1")], returned: 2)))
            .previewLayout(.fixed(width: 320, height: 160))
    }
}
